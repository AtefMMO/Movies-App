import 'package:flutter/material.dart';
import 'package:movies/model/newrealeses_movies_response.dart';

import '../../../app_theme.dart';
import 'image.dart';

class MovieItem extends StatelessWidget {
  var movie;
  bool isBookmarked = false;
  MovieItem({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:
              Image.network(FixImage.fixImage(movie.posterPath ?? 'No Image'))),
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
}
