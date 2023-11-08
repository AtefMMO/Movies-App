import 'dart:ui';
import 'package:flutter/material.dart';

class Category {
  String id;
  String ImageUrl;
  String title;

  Category({required this.title, required this.id, required this.ImageUrl});

  static List<Category> getCategories() {
    return [
      Category(title: 'Action', id: '', ImageUrl: 'assets/images/'),
      Category(title: 'Action', id: '', ImageUrl: 'assets/images/'),
      Category(title: 'Action', id: '', ImageUrl: 'assets/images/'),
      Category(title: 'Action', id: '', ImageUrl: 'assets/images/'),
      Category(title: 'Action', id: '', ImageUrl: 'assets/images/'),
      Category(title: 'Action', id: '', ImageUrl: 'assets/images/'),
    ];
  }
}
