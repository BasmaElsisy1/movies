import 'package:flutter/material.dart';
import 'package:movies/models/SearchRes.dart';
import 'package:movies/modules/Search/Search_item.dart';
import 'package:movies/shared/styles/colors.dart';

import '../../shared/network/remote/api_manager.dart';

class delegateClass extends SearchDelegate {
  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => super.searchFieldStyle;

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
      textTheme: TextTheme(
        // Use this to change the query's text style
        headline6: TextStyle(fontSize: 14, color: Colors.white),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,

      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.red,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(50)),
          focusedBorder:
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                  ,borderSide: BorderSide(color: Colors.white))),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        showResults(context);
      },
      icon: Icon(
        Icons.search,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.black,
      height: double.infinity,
      padding: EdgeInsets.only(top: 20),
      child: FutureBuilder<SearchRes>(
          future: Api_manager.getMovies(searchkeyword: query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.hasError) {
              return Center(child: Text('There is an error'));
            }
            if (!snapshot.hasData) {
              print(snapshot.data?.status_message);
              return Center(
                  child: Text(
                'no data',
                style: TextStyle(color: Colors.red),
              ));
            }
            if (snapshot.data!.status_code == 7) {
              return Center(child: Text(snapshot.data?.status_message ?? ''));
            }
            if (snapshot.hasData) {
              print('yes has data');
              print(snapshot.data?.status_code);
            } else {
              print('no');
            }
            var movies = snapshot.data?.results;
            if (movies?.length == null) {
              print('null');
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(left: 10, right: 20),
                    child: Search_item(
                      movies![index]
                    ));
              },
              itemCount: movies?.length,
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
        child: Container(
      width: double.infinity,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/no-movies.png'),
          SizedBox(
            height: 13,
          ),
          Text(
            'No movies found',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ));
  }
}
