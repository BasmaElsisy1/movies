import 'package:flutter/material.dart';
import 'package:movies/shared/network/remote/api_manager.dart';
import 'package:provider/provider.dart';
import '../../models/toprated.dart';
import '../baseView.dart';
import 'Homepage-navigator.dart';
import 'HomepageScreen-vm.dart';

class HomePageScreen extends StatefulWidget {
  static const String routename = 'HomepageScreen';

  @override
  State<HomePageScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends BaseView<HomePageScreen, HomepageVM>
    implements Homepage_Navigator {
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
          body: FutureBuilder<Movietopratedresponce>(
              future: Api_manager.gettoprated(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError)
                  return Center(
                    child: Column(
                      children: [
                        Text('Something Went wrong'),
                        TextButton(onPressed: () {}, child: Text('Try Again'))
                      ],
                    ),
                  );
                SizedBox(height: 30);
                var Movietoplist = snapshot.data?.results ?? [];
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Movietoplist.length,
                    itemBuilder: (context, index) {
                      return Row(children: [
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          height: 200,
                          width: 130,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Stack(
                                  children: [

                                    Text(
                                      Movietoplist[index].originalTitle ?? "",
                                      style: TextStyle(color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ]),
                        )
                      ]);
                    });
              })),
    );
  }

  @override
  HomepageVM initViewModel() {
    return HomepageVM();
  }
}
