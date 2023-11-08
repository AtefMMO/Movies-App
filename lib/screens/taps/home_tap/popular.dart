import 'package:flutter/material.dart';

import '../../../api_manager.dart';
import '../../../app_theme.dart';
import '../../../model/popular_movies_response.dart';
import 'carousel_slider.dart';

class PopularSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: FutureBuilder<PopularMoviesResponse>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.gold,
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final results = snapshot.data?.results;
            if (results != null && results.isNotEmpty) {
              return Container(child: PopularMoviesSlider(results: results));
            } else {
              return Text('No movies found');
            }
          }
          return Text('No data');
        },
        future: ApiManager.getPopularMovies(),
      ),
    );
  }
}
