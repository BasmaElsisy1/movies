import 'package:flutter/material.dart';

import '../../models/SingleGenRes.dart';

class Search_item extends StatelessWidget{
  Results results;

  Search_item(this.results);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(bottom: 13),
        padding: EdgeInsets.only(bottom: 13),
        decoration: BoxDecoration(
          border:Border(

            bottom: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: Row(
          children: [
            Image.asset('assets/images/movie_item.png'),
            Container(
                margin: EdgeInsets.only(left: 20),
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(results.title!, style: TextStyle(color: Colors.white)),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(results.releaseDate!,
                          style: TextStyle(
                              color: Color.fromRGBO(
                                  255, 255, 255, 0.6705882352941176))),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Image.asset('assets/images/star.png'),
                        SizedBox(width: 5,)
                        ,
                        Text(results.voteAverage.toString(),
                            style: TextStyle(
                                color: Color.fromRGBO(
                                    255, 255, 255, 0.6705882352941176))),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}