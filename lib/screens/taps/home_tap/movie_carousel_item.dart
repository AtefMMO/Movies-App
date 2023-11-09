import 'package:flutter/material.dart';
import 'package:movies/screens/taps/home_tap/image.dart';
import 'package:movies/screens/taps/watchlist_tap/Movie.dart';
import 'package:movies/screens/taps/home_tap/movie_screen.dart';
import '../../../app_theme.dart';
import '../../../model/popular_movies_response.dart';
import '../watchlist_tap/FirerBase_Utils.dart';

class MovieICarouseltemWidget extends StatefulWidget {
  final Result result;

  MovieICarouseltemWidget({required this.result});

  @override
  State<MovieICarouseltemWidget> createState() =>
      _MovieICarouseltemWidgetState();
}

class _MovieICarouseltemWidgetState extends State<MovieICarouseltemWidget> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieName.routeName,
            arguments: MovieData(
              id: widget.result.id.toString(),
            ));
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Image.network(
                    FixImage.fixImage(widget.result.backdropPath ?? ''),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fitHeight),
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.128,
                    left: MediaQuery.of(context).size.width * 0.052),
                child: Image.network(
                    FixImage.fixImage(widget.result.posterPath ?? '')),
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03),
                height: MediaQuery.of(context).size.height * 0.294,
                child: isBookmarked
                    ? Icon(
                        Icons.bookmark_sharp,
                        size: 40,
                        color: AppTheme.lightGold,
                      )
                    : Icon(
                        Icons.bookmark_sharp,
                        size: 40,
                        color: AppTheme.lightGrey,
                      ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.062),
                height: MediaQuery.of(context).size.height * 0.295,
                child: isBookmarked
                    ? const Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.32,
                    left: MediaQuery.of(context).size.width * 0.45),
                child: Text(
                  widget.result.title ?? '',
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
                      widget.result.releaseDate ?? '',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),

            ),
            InkWell(
              onTap: (

                  ){
                addMovie();
                if( isBookmarked)
                {
                  isBookmarked=false;
                }
                else {
                  isBookmarked=true;

                }
                setState(() {
                });
              },
              child: Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.062),
                height: MediaQuery.of(context).size.height * 0.295,
                child: isBookmarked
                    ? const Icon(
                        Icons.check,
                        size: 15,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.32,
                  left: MediaQuery.of(context).size.width * 0.45),
              child: Text(
                widget.result.title ?? '',
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
                    widget.result.releaseDate ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    widget.result.adult! ? '  PG 18' : '  PG 13',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],

                    Text(
                      widget.result.adult! ? '  PG 18' : '  PG 13',
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
                child: const Icon(
                  Icons.play_circle,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void addMovie(){
    Movie movie = Movie(
        id: widget.result!.id.toString());
    print('${widget.result!.id}');
    FirebaseUtils.addMovieToFirebase(movie.id!).timeout(
      Duration(milliseconds: 500),
      onTimeout: (){
        print('movie added to WatchList');

      }
    );
  }

}

class MovieData {
  String? id;
  MovieData({
   required this.id,
  });
}
