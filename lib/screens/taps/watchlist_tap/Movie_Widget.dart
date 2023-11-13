import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../app_theme.dart';
import '../home_tap/image.dart';
import 'Movie.dart';

class MovieWidgetItem extends StatelessWidget {
  String id;
  MovieWidgetItem({required this.id});
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width:
                    MediaQuery.of(context).size.width * 0.5, // Adjusted width
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0), // Adjust the space as needed
                          child: Text(
                            id ?? "",
                            style: Theme.of(context).textTheme.titleLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}