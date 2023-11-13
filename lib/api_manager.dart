import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/api_constants.dart';
import 'package:movies/model/by_id_movies_response.dart';
import 'package:movies/model/popular_movies_response.dart';
import 'package:movies/model/search_movies_response.dart';
import 'model/browse_genre_response.dart';
import 'model/movies_by_genre_response.dart';
import 'package:movies/model/similar_movies_response.dart';

import 'model/newrealeses_movies_response.dart';
import 'model/top_rated_movies_response.dart';

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

  static Future<SearchMoviesResponse> getSearchMovies(String query) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl, ApiConstants.searchApi, {'query': query});
    try {
      var response = await http.get(url, headers: ApiConstants.searchHeaders);
      if (response.statusCode == 200) {
        return SearchMoviesResponse.fromJson(jsonDecode(response.body));
      } else {
        print('Api Request Failed: ${response.statusCode}');
        throw Exception('Api Request Failed');
      }
    } catch (error) {
      print("Api Request Error: $error");
      throw error;
    }
  }

  static Future<TopRatedMoviesResponse> getTopRatedMovies() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.recommendedApi);
    try {
      var response =
          await http.get(url, headers: ApiConstants.recommendedHeaders);
      if (response.statusCode == 200) {
        return TopRatedMoviesResponse.fromJson(jsonDecode(response.body));
      } else {
        print('Api Request Failed: ${response.statusCode}');
        throw Exception('Api Request Failed');
      }
    } catch (error) {
      print("Api Request Error: $error");
      throw error;
    }
  }

  static Future<BrowseGenreResponse> getBrowseGenre(String language) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.browseGenreApi,
        {'language': language});
    try {
      var response =
          await http.get(url, headers: ApiConstants.browseGenreHeaders);
      if (response.statusCode == 200) {
        return BrowseGenreResponse.fromJson(jsonDecode(response.body));
      } else {
        print('Api Request Failed: ${response.statusCode}');
        throw Exception('Api Request Failed');
      }
    } catch (error) {
      print("Api Request Error: $error");
      throw error;
    }
  }

  static Future<MoviesByGenreResponse> getMoviesByGenre(String with_genres) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.moviesByGenreApi,
        {'with_genres': with_genres});
    try {
      var response =
          await http.get(url, headers: ApiConstants.moviesByGenreHeaders);
      if (response.statusCode == 200) {
        return MoviesByGenreResponse.fromJson(jsonDecode(response.body));
      } else {
        print('Api Request Failed: ${response.statusCode}');
        throw Exception('Api Request Failed');
      }
    } catch (error) {
      print("Api Request Error: $error");
      throw error;
    }
  }



  static Future<MoviesById> getMoviesById(String MovieID) async {
    Uri url =
        Uri.https(ApiConstants.baseUrl, ApiConstants.detailsApi + MovieID);
    try {
      var response = await http.get(url, headers: ApiConstants.detailsHeaders);
      if (response.statusCode == 200) {
        return MoviesById.fromJson(jsonDecode(response.body));
      } else {
        print('Api Request Failed: ${response.statusCode}');
        throw Exception('Api Request Failed');
      }
    } catch (error) {
      print("Api Request Error: $error");
      throw error;
    }
  }

  static Future<SimilarMoviesResponse> getSimilarMovies(String MovieID) async {
    Uri url = Uri.https(
        ApiConstants.baseUrl, ApiConstants.similarApi + MovieID + '/similar');
    try {
      var response = await http.get(url, headers: ApiConstants.similarHeaders);
      if (response.statusCode == 200) {
        return SimilarMoviesResponse.fromJson(jsonDecode(response.body));
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
