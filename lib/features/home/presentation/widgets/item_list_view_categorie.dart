import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'item_categorie.dart';
import 'category_model.dart'; // Import the Category model

class ItemListViewCategorie extends StatelessWidget {
  const ItemListViewCategorie({
    super.key,
    required this.categories,
    required this.count,
  });

  final int count;
  final List<Category> categories; // Ensure categories is a list of Category

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: ItemCategorie(
              categorieText: category.name,
              imagePath: category.imagePath,
              onPress: () {
                Navigator.pushNamed(context, category.route);
              },
            ),
          );
        },
      ),
    );
  }
}
