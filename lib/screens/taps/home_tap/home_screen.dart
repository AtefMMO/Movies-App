import 'package:flutter/material.dart';
import 'package:movies/api_manager.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/model/popular_movies_response.dart';
import 'package:movies/screens/taps/home_tap/carousel_slider.dart';
import 'package:movies/screens/taps/home_tap/image.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.black,
      child: Stack(
        children: [
          Center(
            child: FutureBuilder<PopularMoviesResponse>(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(color: AppTheme.gold,);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final results = snapshot.data?.results;
                  if (results != null && results.isNotEmpty) {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final movie = results[index];
                        return Container(child: PopularMoviesSlider(results: results));
                      },
                    );
                  } else {
                    return Text('No movies found');
                  }
                }
                return Text('No data');
              },
              future: ApiManager.getPopularMovies(),
            ),
          )
        ],
      ),
    );
  }
}
