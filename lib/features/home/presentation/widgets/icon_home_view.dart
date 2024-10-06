// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routers/routers_name.dart';
import 'category_model.dart';
import 'item_list_top_selling.dart';
import 'item_list_view.dart';
import 'item_list_view_categorie.dart';
import 'search_text_field.dart';
import 'text_spacer_text.dart';

class IconHomeView extends StatelessWidget {
  const IconHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(
          name: "Hoodies",
          route: Routes.hoodiesScreen,
          imagePath: 'assets/images/home_images/hoodie.png'),
      Category(
          name: "Shorts",
          route: Routes.shortsScreen,
          imagePath: 'assets/images/home_images/short.png'),
      Category(
          name: "Bags",
          route: Routes.bagsScreen,
          imagePath: 'assets/images/home_images/bag.png'),
      Category(
          name: "Shoes",
          route: Routes.shoesScreen,
          imagePath: 'assets/images/home_images/shoes.png'),
      Category(
          name: "Accessories",
          route: Routes.accessoriesScreen,
          imagePath: 'assets/images/home_images/accessorie.png'),
    ];
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 127.h),
              const SearchTextField(),
              SizedBox(height: 10.h),
              TextSpacerText(
                leadingText: 'Categories',
                textPress: () {},
              ),
              ItemListViewCategorie(
                categories: categories,
                count: categories.length,
              ),
              TextSpacerText(
                leadingText: "Top Selling",
                textPress: () {},
              ),
              const ItemListView(
                height: 300,
                itemBuilder: ItemListTopSelling(),
              ),
              SizedBox(height: 10.h),
              TextSpacerText(
                leadingText: "New In",
                textPress: () {},
              ),
              const ItemListView(
                height: 300,
                itemBuilder: ItemListTopSelling(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
