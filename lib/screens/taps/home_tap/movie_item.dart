import 'package:flutter/material.dart';
import 'package:movies/model/newrealeses_movies_response.dart';
import '../../../app_theme.dart';
import '../watchlist_tap/FirerBase_Utils.dart';
import '../watchlist_tap/Movie.dart';
import 'image.dart';

class MovieItem extends StatefulWidget {
  var movie;

  MovieItem({required this.movie});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: (){
          addMovie();
          if( isBookmarked)
          {
            isBookmarked=false;
          }
          else {
            isBookmarked=true;

          }
          setState(() {
          });
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
                Image.network(FixImage.fixImage(widget.movie.posterPath ?? 'No Image'))),
      ),
            isBookmarked
          ? Icon(
              Icons.bookmark_sharp,
              size: 30,
              color: AppTheme.lightGold,
            )
          : Icon(
              Icons.bookmark_sharp,
              size: 30,
              color: AppTheme.lightGrey,
            ),
      Padding(
        padding: const EdgeInsets.all(7),
        child: isBookmarked
            ? const Icon(
                Icons.check,
                size: 15,
                color: Colors.white,
              )
            : const Icon(
                Icons.add,
                size: 15,
                color: Colors.white,
              ),
      ),
    ]);
  }

  void addMovie(){
    Movie movie = Movie(
        id: widget.movie!.id.toString()
    );
    FirebaseUtils.addMovieToFirebase(movie.id!).timeout(
        Duration(milliseconds: 500),
        onTimeout: (){
          print('movie added to WatchList');
        }
    );
  }
}
