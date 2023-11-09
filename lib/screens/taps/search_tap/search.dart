import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/api_manager.dart';
import 'package:movies/model/search_movies_response.dart';
import 'package:movies/screens/taps/search_tap/movie_search_item.dart';

import '../../../app_theme.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
  var searchResults = [];
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.black,
      child: SafeArea(
        child: Container(
          height: double.infinity,
          child: Column(
            children: [
              Container(), // Empty container can be removed
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (value) {
                    query = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppTheme.darkGrey,
                    // Background color of the search bar
                    hintText: 'Search',
                    hintStyle: TextStyle(color: AppTheme.lightGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppTheme.lighterGrey,
                    ), // Search icon
                  ),
                ),
              ),
              query.isEmpty
                  ? Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.27),
                      child: Column(
                        children: [
                          Icon(Icons.local_movies,
                              color: AppTheme.lighterGrey,
                              size: MediaQuery.of(context).size.width * 0.35),
                          Text(
                            'No Movies Found',
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ],
                      ),
                    )
                  : FutureBuilder<SearchMoviesResponse>(
                      future: ApiManager.getSearchMovies(query),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppTheme.gold,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          widget.searchResults = snapshot.data!.results ?? [];
                          return Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return MovieSearchItem(
                                    movie: widget.searchResults[index]);
                              },
                              itemCount: widget.searchResults.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
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
