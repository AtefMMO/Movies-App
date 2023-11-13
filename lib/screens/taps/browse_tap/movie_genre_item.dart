import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/taps/home_tap/image.dart';
import '../../../model/movies_by_genre_response.dart';

class MovieGenreItem extends StatelessWidget {
  late Results movie;

  MovieGenreItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width:
                      MediaQuery.of(context).size.width * 0.3, // Adjusted width
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: CachedNetworkImage(
                    imageUrl: FixImage.fixImage(movie.posterPath ?? ""),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    // Changed to BoxFit.cover for aspect ratio
                  ),
                ),
                SizedBox(width: 15.0),
                Container(
                  width:
                      MediaQuery.of(context).size.width * 0.5, // Adjusted width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0), // Adjust the space as needed
                        child: Text(
                          movie.title ?? "",
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0), // Adjust the space as needed
                        child: Text(
                          movie.releaseDate ?? "",
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0), // Adjust the space as needed
                        child: Text(
                          movie.originalLanguage ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
