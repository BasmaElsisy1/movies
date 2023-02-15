import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/modules/Homepage/HomepageScreen.dart';
import 'package:movies/modules/Search/searchScreen.dart';
import 'package:movies/modules/Single_category/single_category.dart';
import 'package:movies/modules/Wishlist/WishlistScreen.dart';
import 'package:movies/modules/home.dart';
import 'package:movies/providers/genres_provider.dart';
import 'package:provider/provider.dart';

import 'modules/categories/CategoriesScreen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => Genress_provider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,

      routes: {
        HomeScreen.routeName: (context) =>HomeScreen(),
        CategoriesScreen.routename: (context) =>CategoriesScreen(),
        SingleCategory.routename: (context) =>SingleCategory(),
        HomePageScreen.routename: (context) =>HomePageScreen(),
        searchScreen.routename: (context) =>searchScreen(),
        WishlistScreen.routename: (context) =>WishlistScreen(),
      },
    );
  }
}


