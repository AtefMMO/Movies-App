import 'package:flutter/material.dart';
import 'package:movies/api_manager.dart';
import 'package:movies/model/newrealeses_movies_response.dart';
import 'package:movies/screens/taps/home_tap/movie_item.dart';

import '../../../app_theme.dart';

class NewRealeses extends StatelessWidget {
  List<Results>? results;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      color: AppTheme.darkGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'New Releases',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder<NewrealesesMoviesResponse>(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(color: AppTheme.gold));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                results = snapshot.data!.results;
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: MovieItem(
                          movie: results![index],
                        ),
                      );
                    },
                    itemCount: results!.length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }
            },
            future: ApiManager.getNewRealeses(),
          )
        ],
      ),
    );
  }
}
