import 'package:flutter/material.dart';
import 'package:movies/model/browse_genre_response.dart';

class BrowseProvider extends ChangeNotifier {
  Genres? _selectedGenre;
  Genres? get selectedGenre => _selectedGenre;

  void setSelectedGenre(Genres? genre) {
    _selectedGenre = genre;
    notifyListeners();
  }

  void navigateBackToCategories() {
    _selectedGenre = null;
    notifyListeners();
  }
}
