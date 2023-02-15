import 'package:flutter/material.dart';
import 'package:movies/models/GenresRes.dart';
import 'package:movies/modules/Single_category/single_category.dart';
import 'package:provider/provider.dart';
import '../../shared/network/remote/api_manager.dart';
import '../baseView.dart';
import 'CategoriesScreen-navigator.dart';
import 'CategoriesScreen-vm.dart';
import 'category_item.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routename = 'CategoriesScreen';

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState
    extends BaseView<CategoriesScreen, CategoriesScreenVM>
    implements CategoriesScreen_Navigator {
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
                'Browse Category',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            FutureBuilder<GenresRes>(
              future: Api_manager.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()));
                }
                if (snapshot.hasError) {
                  return Center(child: Text('There is an error'));
                }
                if (snapshot.data!.status_code == 7) {
                  return Center(
                      child: Text(snapshot.data?.status_message ?? ''));
                }
                if (snapshot.hasData) {
                  print('yes has data');
                } else {
                  print('no');
                }
                var categories = snapshot.data?.genres;

                return Expanded(
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 20,
                            childAspectRatio: 1.3),
                        itemCount: categories!.length,
                        itemBuilder: (context, index) {
                          return Category_item(categories[index]);
                        }));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  CategoriesScreenVM initViewModel() {
    return CategoriesScreenVM();
  }


}
