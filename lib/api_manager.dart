import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/api_constants.dart';
import 'package:movies/model/popular_movies_response.dart';

class ApiManager {
  static Future<PopularMoviesResponse> getPopularMovies() async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.popularApi
    );
    try {
      var response = await http.get(url, headers: ApiConstants.headers);

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
}
