import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/screens/taps/watchlist_tap/Movie.dart';


class FirebaseUtils {

  static CollectionReference<Movie> getMovieCollection() {
    return FirebaseFirestore.instance
        .collection(Movie.collectionName)
        .withConverter<Movie>(
        fromFirestore: (snapshot, options) => Movie.fromFireStore(snapshot.data()!),
        toFirestore: (value, options) => value.toFireStore()
    );
  }
  static Future<void> addMovieToFirebase(String id) {
    var collection = getMovieCollection();
    var docRef = collection.doc();
    //id = docRef.id;

    return docRef.set(Movie(id: id));
  }
  static Future<List<Movie>> getMovieFromFireBase() async {
    List<Movie> movie = [];
    QuerySnapshot<Movie> snapshot = await getMovieCollection().get();
    movie = snapshot.docs.map((doc) => doc.data()).toList();
    return movie;

  }

}