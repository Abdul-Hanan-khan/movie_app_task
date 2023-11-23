import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:movie_app_task/src/core/app_apis.dart';
import 'package:movie_app_task/src/model/movie_details_model.dart';

import 'package:movie_app_task/src/model/upcoming_movies.dart';
import 'package:http/http.dart' as http;
class ApiService {
  static Future<UpComingMovie> upcomingMovies() async {
    try {
      var response = await http.get(
        Uri.parse("${AppApis.baseUrl}/movie/upcoming?api_key=${AppApis.apiKey}"),
      );
      if (response.statusCode == 200) {
        return UpComingMovie.fromJson(jsonDecode(response.body));

      } else
        return UpComingMovie();
    }
    catch (e) {
      return UpComingMovie();
    }
  }

  static Future<SingleMovieDetails> getSingleMovieDetails({@required int? movieId}) async {
    try {
      var response = await http.get(
        Uri.parse("${AppApis.baseUrl}/movie/$movieId?api_key=${AppApis.apiKey}"),
      );
      if (response.statusCode == 200) {
        return SingleMovieDetails.fromJson(jsonDecode(response.body));

      } else
        return SingleMovieDetails();
    }
    catch (e) {
      return SingleMovieDetails();
    }
  }
  static Future<String> getMovieTrailer({@required int? movieId}) async {
    try {
      var response = await http.get(
        Uri.parse("${AppApis.baseUrl}/movie/$movieId/videos?api_key=${AppApis.apiKey}"),
      );
      if (response.statusCode == 200) {

        var tempResponse = jsonDecode(response.body);
        String trailerKey = tempResponse["results"][4]["key"];
        return trailerKey;

      } else
        return "";
    }
    catch (e) {
      return "";
    }
  }
  static Future<UpComingMovie> searchMovie({String? query}) async {
    try {
      var response = await http.get(
        Uri.parse("${AppApis.baseUrl}/search/movie?api_key=${AppApis.apiKey}&query=$query"),
      );
      if (response.statusCode == 200) {
        return UpComingMovie.fromJson(jsonDecode(response.body));

      } else
        return UpComingMovie();
    }
    catch (e) {
      return UpComingMovie();
    }
  }


}
