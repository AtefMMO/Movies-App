import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/provider/browse_provider.dart';
import 'package:provider/provider.dart';
import 'package:movies/screens/main_screen.dart';
import 'package:movies/screens/taps/home_tap/movie_screen.dart';
import 'app_theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BrowseProvider()),
    ],
    child: MyApp(),
  ),);
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
