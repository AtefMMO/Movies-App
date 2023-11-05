import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movies/screens/taps/home_tap/image.dart';

import '../../../app_theme.dart';
import '../../../model/popular_movies_response.dart';

class MovieItemWidget extends StatelessWidget {
  final Result result;

  MovieItemWidget({required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              child: Image.network(FixImage.fixImage(result.backdropPath ?? ''),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fitHeight),
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
            ),
            Container(
              padding: EdgeInsets.only(top: 100, left: 20),
              child: Image.network(FixImage.fixImage(result.posterPath ?? '')),
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Container(
              padding: EdgeInsets.only(left: 12),
              child: Icon(
                Icons.bookmark_add_outlined,
                size: 40,
                color: AppTheme.lightGrey,
              ),
              height: MediaQuery.of(context).size.height * 0.295,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.32,
                  left: MediaQuery.of(context).size.width * 0.45),
              child: Text(
                result.title ?? '',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.36,
                  left: MediaQuery.of(context).size.width * 0.45),
              child: Row(
                children: [
                  Text(
                    result.releaseDate ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    result.adult! ? '  PG 18' : '  PG 13',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.5),
              child: Icon(
                Icons.play_circle,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
