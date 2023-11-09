import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/main_screen.dart';
import 'package:movies/screens/taps/home_tap/movie_screen.dart';
import 'app_theme.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => MainScreen(),
        MovieName.routeName:(context)=>MovieName()
      },
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
    );
  }
}
