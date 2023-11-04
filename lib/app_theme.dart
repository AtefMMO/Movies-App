import 'package:flutter/material.dart';

class AppTheme {
  static Color grey = Color(0xff514F4F);
  static Color black = Color(0xff121312);
  static Color gold = Color(0xffFFB224);
  static Color lighGrey = Color(0xffC6C6C6);
  static ThemeData appTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: gold,
        unselectedItemColor: lighGrey,
        backgroundColor: black),
  );
}
