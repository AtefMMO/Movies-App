import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/api_manager.dart';
import 'package:movies/model/browse_genre_response.dart';
import 'package:movies/provider/browse_provider.dart';
import 'package:provider/provider.dart';
import '../../../app_theme.dart';
import '../../../model/movies_by_genre_response.dart';
import 'movie_genre_item.dart';

class MoviesByGenre extends StatefulWidget {
  late List<Results> searchResults;

  Genres? genre;
  MoviesByGenre({required this.genre});

  @override
  State<MoviesByGenre> createState() => _MoviesByGenreState();
}

class _MoviesByGenreState extends State<MoviesByGenre> {
  @override
  Widget build(BuildContext context) {
    var browseProvider = Provider.of<BrowseProvider>(context);
    return Container(
      padding: EdgeInsets.only(top: 20),
      color: AppTheme.black,
      child: SafeArea(
        child: Container(
          height: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                        onTap: (){
                          browseProvider.navigateBackToCategories();
                          setState(() {
                          });
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: AppTheme.lighterGrey,
                        )),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        widget.genre!.name!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              FutureBuilder<MoviesByGenreResponse>(
                future:
                    ApiManager.getMoviesByGenre(widget.genre!.id.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.gold,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    widget.searchResults = snapshot.data!.results!;
                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return MovieGenreItem(
                              movie: widget.searchResults[index]);
                        },
                        itemCount: widget.searchResults.length,
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
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
