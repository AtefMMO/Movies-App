import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/taps/watchlist_tap/FirerBase_Utils.dart';
import 'package:movies/screens/taps/watchlist_tap/Movie.dart';
import 'package:movies/screens/taps/watchlist_tap/watchlist_movies.dart';
import '../../../app_theme.dart';
import 'Movie_Widget.dart';

class WatchListScreen extends StatefulWidget {
  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  List<Movie> movieList = [];

  @override
  void initState() {
    super.initState();

    getAllMovieFromFireStore();
  }

  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.black,
      child: Stack(
        children: [
          ListView.separated(
            itemBuilder: (context, index) {
              return WatchListMovies(
                id: movieList[index].id.toString(),
              );
            },
            itemCount: movieList.length,
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(
                  color: AppTheme.darkGrey,
                  thickness: 1,
                  height: 1,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void getAllMovieFromFireStore() async {
    QuerySnapshot<Movie> querySnapshot =
        await FirebaseUtils.getMovieCollection().get();
    List<Movie> moviesToAdd = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    for (var movie in moviesToAdd) {
      if (!movieList.any((existingMovie) => existingMovie.id == movie.id)) {
        movieList.add(movie);
      }
    }
    setState(() {});
  }
}
