import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/api_constants.dart';
import 'package:movies/model/popular_movies_response.dart';

import 'model/newrealeses_movies_response.dart';

class ApiManager {
  static Future<PopularMoviesResponse> getPopularMovies() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularApi);
    try {
      var response = await http.get(url, headers: ApiConstants.popularHeaders);

      if (response.statusCode == 200) {
        return PopularMoviesResponse.fromJson(jsonDecode(response.body));
      } else {
        // Log the response status code for debugging
        print("API Request Failed: ${response.statusCode}");
        throw Exception("API Request Failed");
      }
    } catch (error) {
      // Log the error for debugging
      print("API Request Error: $error");
      throw error;
    }
  }

  static Future<NewrealesesMoviesResponse> getNewRealeses() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newRealesesApi);
    try {
      var response =
          await http.get(url, headers: ApiConstants.newRealsesHeaders);
      if (response.statusCode == 200) {
        return NewrealesesMoviesResponse.fromJson(jsonDecode(response.body));
      } else {
        print('Api Request Failed: ${response.statusCode}');
        throw Exception('Api Request Failed');
      }
    } catch (error) {
      print("Api Request Error: $error");
      throw error;
    }
  }
}
