import 'package:flutter/material.dart';
import 'package:movies/modules/categories/CategoriesScreen.dart';
import 'package:provider/provider.dart';
import '../../../providers/myProvider.dart';
import 'Homepage/HomepageScreen.dart';
import 'Search/search.dart';
import 'Search/searchScreen.dart';
import 'Wishlist/WishlistScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        onTap: (index) {
          if (index == 1) {
            showSearch(context: context, delegate: delegateClass());
          } else {
            current_index = index;
          }
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Home_icon.png'),
              size: 40,
            ),
            label: 'Home',
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/search_icon.png'),
                  size: 40),
              label: 'Search',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/browse_icon.png'),
                  size: 40),
              label: 'Browse',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/wishlist_icon.png'),
                  size: 40),
              label: 'Watchlist',
              backgroundColor: Colors.black),
        ],
      ),
      body: screen[current_index],
    );
  }

  List<Widget> screen = [
    HomePageScreen(),
    searchScreen(),
    CategoriesScreen(),
    WishlistScreen(),
  ];
}
