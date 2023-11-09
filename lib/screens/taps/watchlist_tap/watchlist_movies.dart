import 'package:flutter/material.dart';
import 'package:movies/api_manager.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/taps/search_tap/movie_search_item.dart';

class WatchListMovies extends StatelessWidget {
String id;
WatchListMovies({required this.id});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder:(context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(color: AppTheme.gold,));
      }else if(snapshot.hasError){
        return Text('Error: ${snapshot.error}');
      }else{
        var response=snapshot.data;
        return MovieSearchItem(movie: response!);
      }
    },future: ApiManager.getMoviesById(id), );
  }
}
