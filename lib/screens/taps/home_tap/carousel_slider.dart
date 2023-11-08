import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/taps/home_tap/movie_carousel_item.dart';

import '../../../model/popular_movies_response.dart';

class PopularMoviesSlider extends StatelessWidget {
  List<Result> results;
  PopularMoviesSlider({required this.results});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: results.isEmpty
            ? []
            : results
                .map((result) => MovieICarouseltemWidget(result: result))
                .toList(),
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.4,
            autoPlay: true,
            enableInfiniteScroll: true,
            viewportFraction: 1));
  }
}
