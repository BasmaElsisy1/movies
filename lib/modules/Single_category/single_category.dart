import 'package:flutter/material.dart';
import 'package:movies/models/GenresRes.dart';
import 'package:movies/models/SingleGenRes.dart';
import 'package:movies/modules/Single_category/movie_item.dart';
import 'package:movies/modules/Single_category/single_category_VM.dart';
import 'package:movies/modules/Single_category/single_category_navigator.dart';
import 'package:movies/modules/baseView.dart';
import 'package:movies/providers/genres_provider.dart';
import 'package:provider/provider.dart';

import '../../shared/network/remote/api_manager.dart';

class SingleCategory extends StatefulWidget {
  static const String routename = 'SingleCategory';

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}

class _SingleCategoryState extends BaseView<SingleCategory, SingleCategoryVM>
    implements SingleCategoryNavigator {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.myNavigator = this;

  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Genress_provider>(context);
    var categories = ModalRoute.of(context)!.settings.arguments as Genres;
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only( bottom: 20),
              child: Text(
                '${categories.name} List',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            FutureBuilder<SingleGenRes>(
              future: Api_manager.getSingleCategory(categories.id.toString()),

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Center(child: CircularProgressIndicator()));
                }
                if (snapshot.hasError) {
                  return Center(child: Text('There is an error' , style: TextStyle(color: Colors.white)));
                }
                if (snapshot.data!.status_code == 7) {
                  return Center(
                      child: Text(snapshot.data?.status_message ?? '', style: TextStyle(color: Colors.white),));
                }
                if (snapshot.hasData) {
                  print('yes has data 233');
                } else {
                  print('no');
                }
                var singleCategoryResult = snapshot.data?.results??[];

                return Expanded(
                    child: ListView.builder(

                        itemCount: singleCategoryResult.length,
                        itemBuilder: (context, index) {
                          return MovieItem(
                            singleCategoryResult[index],

                          );
                        }));
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  SingleCategoryVM initViewModel() {
    return SingleCategoryVM();
  }
}
