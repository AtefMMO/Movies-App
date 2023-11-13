import 'package:flutter/material.dart';
import 'package:movies/screens/taps/browse_tap/category_fragments.dart';
import 'package:provider/provider.dart';
import '../../../api_manager.dart';
import '../../../app_theme.dart';
import '../../../model/browse_genre_response.dart';
import '../../../provider/browse_provider.dart';
import 'movies_by_genre.dart';

class BrowseScreen extends StatefulWidget {
  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    var browseProvider = Provider.of<BrowseProvider>(context);
    Genres? selectedGenre = browseProvider.selectedGenre;
    String language = 'en';
    return Container(
      color: AppTheme.black,
      child: SafeArea(
        child: Container(
          color: AppTheme.black,
          child: Stack(
            children: [
              FutureBuilder<BrowseGenreResponse>(
                future: ApiManager.getBrowseGenre(language),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppTheme.gold,
                    ));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    var genreResult = snapshot.data!.genres!;
                    return browseProvider.selectedGenre?.name == null
                        ? CategoryFragments(
                            genresList: genreResult,
                            imagePaths: [
                              "assets/images/action.jpg",
                              "assets/images/adventure.jpg",
                              "assets/images/animation.jpg",
                              "assets/images/comdey.jpg",
                              "assets/images/crime.png",
                              "assets/images/documentary.jpg",
                              "assets/images/drama.jpg",
                              "assets/images/family.png",
                              "assets/images/fantasy.png",
                              "assets/images/history.jpg",
                              "assets/images/horror.webp",
                              "assets/images/music.png",
                              "assets/images/mystery.webp",
                              "assets/images/romance.jpg",
                              "assets/images/science-fiction.webp",
                              "assets/images/tv-movies.jpg",
                              "assets/images/thriller.jpeg",
                              "assets/images/war.jpg",
                              "assets/images/western.webp",
                            ],
                            onTap: (newselectedGenre) {
                              browseProvider.setSelectedGenre(newselectedGenre);
                            })
                        : MoviesByGenre(genre: selectedGenre!);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
