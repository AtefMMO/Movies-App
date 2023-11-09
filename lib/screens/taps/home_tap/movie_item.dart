import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            addMovie();
            if (isBookmarked) {
              isBookmarked = false;
            } else {
              isBookmarked = true;
            }
            setState(() {});
          },
          child: CachedNetworkImage(
            imageUrl: FixImage.fixImage(widget.movie.posterPath ?? 'No Image'),
            errorWidget: (context, url, error) => Center(
                child: Icon(
              Icons.error,
              size: 50,
            )),
            // Changed to BoxFit.cover for aspect ratio
          ),
        ),
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

  void addMovie() {
    Movie movie = Movie(id: widget.movie!.id.toString());
    FirebaseUtils.addMovieToFirebase(movie.id!)
        .timeout(Duration(milliseconds: 500), onTimeout: () {
      print('movie added to WatchList');
    });
  }
}
