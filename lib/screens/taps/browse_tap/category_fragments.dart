import 'package:flutter/material.dart';

import '../../../model/categoryTest.dart';
import 'category_item.dart';

class CategoryFragments extends StatelessWidget {
  var categoriesList = Category.getCategories();

  // Function onCategoryClick;
  // CategoryFragments({required this.onCategoryClick});

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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 18, crossAxisSpacing: 18),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // onCategoryClick(categoriesList[index]);
                  },
                  child: CategoryItem(category: categoriesList[index]),
                );
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
