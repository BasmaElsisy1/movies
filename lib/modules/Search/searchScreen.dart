import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../baseView.dart';
import 'search-navigator.dart';
import 'search-vm.dart';

class searchScreen extends StatefulWidget {
  static const String routename = 'SearchScreen';

  @override
  State<searchScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends BaseView<searchScreen, searchVM>
    implements search_Navigator {
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
  searchVM initViewModel() {
    return searchVM();
  }
}
