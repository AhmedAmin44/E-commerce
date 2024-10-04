import 'package:flutter/material.dart';
import 'package:test1/widgets/bar_sort.dart';
import 'package:test1/widgets/product_gridview.dart';
import 'package:test1/widgets/responsive_tagcontainer.dart';
import 'package:test1/widgets/search_category_list.dart';
import '../widgets/search_bar.dart'; // Import the CustomSearchBar widget


class SearchDetailes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const CustomSearchBar(),
            const SizedBox(height: 40),
             BarSort(),
             const SizedBox(height: 40),
          Text(
  '53 Results Found',
  style: TextStyle(
    color: Color(0xFF272727),
    fontSize: 12,
    fontFamily: 'Circular Std',
    fontWeight: FontWeight.w400,
    height: 0.13,
  ),
),
             // Use the CustomSearchBar widget
            const SizedBox(height: 20),
            Expanded(child: ProductGrid()), // Use the CategoryList widget
          ],
        ),
      ),
    );
  }
}
