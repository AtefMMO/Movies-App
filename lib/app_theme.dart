import 'package:flutter/material.dart';

class AppTheme {
  static Color grey = Color(0xff514F4F);
  static Color lightGrey=Color(0xff707070);
  static Color darkGrey=Color(0xff343534);
  static Color black = Color(0xff121312);
  static Color gold = Color(0xffFFB224);
  static Color lighterGrey = Color(0xffC6C6C6);
  static Color lightBlack=Color(0xff1A1A1A);
  static ThemeData appTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: gold,
        unselectedItemColor: lighterGrey,
        backgroundColor: black),
    textTheme: TextTheme(titleMedium: TextStyle(fontSize: 15,color: Colors.white),
        titleSmall: TextStyle(fontSize: 12,color: lighterGrey))
  );
}
