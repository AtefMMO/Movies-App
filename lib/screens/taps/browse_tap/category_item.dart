import 'package:flutter/material.dart';
import 'package:movies/model/categoryTest.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158,
      height: 90,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
      child: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                category.ImageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
