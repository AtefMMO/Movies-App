import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/screens/taps/watchlist_tap/FirerBase_Utils.dart';
import 'package:movies/screens/taps/watchlist_tap/Movie.dart';
import '../../../app_theme.dart';
import 'Movie_Widget.dart';

class WatchListScreen extends StatefulWidget {
  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}


class _WatchListScreenState extends State<WatchListScreen> {

  @override
  List<Movie> MovieList=[];
  @override
  void initState() {
    super.initState();
    // Fetch data from Firestore when the widget initializes
     getAllMovieFromFireStore();

  }
  Widget build(BuildContext context) {
    // if (MovieList.isEmpty){getAllMovieFromFireStore();
    // }
    return Container(
      color: AppTheme.black,
      child: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return MovieWidgetItem(id:MovieList[index].id!,);
            },
            itemCount: MovieList.length,
          )
        ],
      ),
    );
  }

  void getAllMovieFromFireStore()async{
   QuerySnapshot<Movie> querySnapshot= await FirebaseUtils.getMovieCollection().get();
   MovieList = querySnapshot.docs.map((doc) {
     return doc.data();
   }).toList();
   setState(() {

   });

  }
}
