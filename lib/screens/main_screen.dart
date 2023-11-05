import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/taps/browse.dart';
import 'package:movies/screens/taps/home_screen.dart';
import 'package:movies/screens/taps/search.dart';
import 'package:movies/screens/taps/watch_list.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = 'MainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [HomeScreen(),SearchScreen(),BrowseScreen(),WatchListScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: AppTheme.appTheme.copyWith(canvasColor: AppTheme.lightBlack),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Browse'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Watchlist'),
          ],
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            selectedIndex = newIndex;
            setState(() {

            });
          },
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
