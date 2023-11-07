import 'package:flutter/material.dart';

import 'package:movies/app_theme.dart';

import 'package:movies/screens/taps/home_tap/new_realeses.dart';
import 'package:movies/screens/taps/home_tap/popular.dart';
import 'package:movies/screens/taps/home_tap/recommended.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppTheme.black,
        child: Column(
          children: [
            SafeArea(
              child: Container(),
            ),
            PopularSlider(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: NewRealeses(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Recomended(),
            )
          ],
        ),
      ),
    );
  }
}
