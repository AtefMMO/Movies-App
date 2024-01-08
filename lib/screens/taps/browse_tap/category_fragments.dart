import 'package:flutter/material.dart';
import '../../../model/browse_genre_response.dart';
import 'category_item.dart';

class CategoryFragments extends StatelessWidget {
  late List<Genres> genresList;
  late List<String> imagePaths;
  Function onTap;

  CategoryFragments({required this.genresList, required this.imagePaths,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Browse category',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.5,
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onTap(genresList[index]);
                  },
                  child: CategoryItem(genres: genresList[index],
                    imagePath: imagePaths[index],),
                );
              },
              itemCount: genresList.length,
            ),
          )
        ],
      ),
    );
  }
}
