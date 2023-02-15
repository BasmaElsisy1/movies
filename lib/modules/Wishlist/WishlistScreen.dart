import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../baseView.dart';
import 'Wishlist-navigator.dart';
import 'Wishlist-vm.dart';

class WishlistScreen extends StatefulWidget {
  static const String routename = 'WishlistScreen';

  @override
  State<WishlistScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends BaseView<WishlistScreen, WishlistVM>
    implements Wishlist_Navigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.myNavigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'searchScreen',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  WishlistVM initViewModel() {
    return WishlistVM();
  }
}
