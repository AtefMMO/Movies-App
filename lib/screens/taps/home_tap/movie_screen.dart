import 'package:flutter/material.dart';
import 'package:movies/api_manager.dart';
import 'package:movies/model/similar_movies_response.dart';
import 'package:movies/screens/taps/home_tap/movie_item.dart';

import '../../../app_theme.dart';
import 'image.dart';
import 'movie_carousel_item.dart';

class MovieName extends StatelessWidget {
  static const String routeName = 'MovieName';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MovieData;
    return Scaffold(
      body: Container(
        color: AppTheme.lightBlack,
        child: SingleChildScrollView(
          child: SafeArea(
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppTheme.gold,
                  ));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  var result = snapshot.data;
                  print(args.id);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(onTap: () {
                            Navigator.pop(context);
                          },
                            child: Icon(
                              Icons.arrow_back,
                              color: AppTheme.lighterGrey,
                            ),
                          ),

                          Expanded(
                            child: Text(
                              result!.title!,
                              style: Theme.of(context).textTheme.titleLarge,
textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            child: Image.network(
                                FixImage.fixImage(result.backdropPath ?? ''),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fitHeight),
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1,
                                left: MediaQuery.of(context).size.width * 0.4),
                            child: const Icon(
                              Icons.play_circle,
                              size: 80,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          result!.originalTitle!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15),
                        child: Text(
                          result!.releaseDate!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Container(height: MediaQuery.of(context).size.height*0.4,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                  height: MediaQuery.of(context).size.height * 0.4,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: MovieItem(movie: result)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      child: Text(
                                        result.status!,
                                        style:
                                            Theme.of(context).textTheme.titleMedium,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        result.overview!,
                                        style: Theme.of(context).textTheme.titleSmall,
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppTheme.gold,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          result.voteAverage.toString()!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<SimilarMoviesResponse>(
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppTheme.gold,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            var response = snapshot.data!.results;
                            return Padding(
                              padding: const EdgeInsets.only(top: 20,bottom: 20),
                              child: Container(

                                height: MediaQuery.of(context).size.height * 0.25,
                                width: double.infinity,
                                color: AppTheme.darkGrey,
                                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('More Like This',style: Theme.of(context).textTheme.titleMedium,),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                                            child: MovieItem(
                                              movie: response![index],
                                            ),
                                          );
                                        },
                                        itemCount: response!.length,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                        future: ApiManager.getSimilarMovies(args.id.toString()),
                      )
                    ],
                  );
                }
              },
              future: ApiManager.getMoviesById(args.id.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
