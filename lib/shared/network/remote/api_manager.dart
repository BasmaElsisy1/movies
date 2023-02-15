import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies/models/GenresRes.dart';
import 'package:movies/shared/constant.dart';

import '../../../models/SearchRes.dart';
import '../../../models/SingleGenRes.dart';
import '../../../models/toprated.dart';

class Api_manager {
  static Future<GenresRes> getCategories() async {
    Uri URL = Uri.https(Base_URL, '3/genre/movie/list', {"api_key": API_Key});
    Response genres = await http.get(URL);
    try {
      var json = jsonDecode(genres.body);
      GenresRes response = GenresRes.fromJson(json);
      return response;
    } catch (e) {
      print("Error$e");
      throw e;
    }
  }
  static Future<SingleGenRes> getSingleCategory(String genresID) async {
    Uri URL = Uri.https(Base_URL, '3/discover/movie', {"api_key": API_Key , "with_genres" : genresID});
    Response genres = await http.get(URL);
    try {
      var json = jsonDecode(genres.body);
      SingleGenRes response = SingleGenRes.fromJson(json);
      return response;
    } catch (e) {
      print("Error$e");
      throw e;
    }
  }

  static Future<SearchRes> getMovies(
      { String? searchkeyword}) async {
    Uri URL = Uri.https(Base_URL, '3/search/movie',
        {"api_key": API_Key, "query": searchkeyword});

    try {
      Response newsData = await http.get(URL);
      var json = jsonDecode(newsData.body);
      SearchRes response = SearchRes.fromJson(json);
      return response;
    } catch (e) {
      print("Error$e");
      throw e;
    }
  }


  static Future<Movietopratedresponce> gettoprated() async {
    Uri url = Uri.https(Base_URL, '3/movie/top_rated', {"api_key": API_Key});
    Response sources = await http.get(url);
    try {
      var json = jsonDecode(sources.body);
      Movietopratedresponce topratedrespons = Movietopratedresponce.fromJson(
          json);
      return topratedrespons;
    } catch (e) {
      throw e;
    }
  }






}
