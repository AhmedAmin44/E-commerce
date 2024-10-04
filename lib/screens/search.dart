import 'package:flutter/material.dart';
import 'package:test1/widgets/search_category_list.dart';
import '../widgets/search_bar.dart'; // Import the CustomSearchBar widget


class Search extends StatelessWidget {
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
            Text(
              'Shop by Categories',
              style: const TextStyle(
                color: Color(0xFF272727),
                fontSize: 24,
                fontFamily: 'Gabarito',
                fontWeight: FontWeight.w700,
              ),
            ),
             // Use the CustomSearchBar widget
            const SizedBox(height: 20),
            const Expanded(child: CategoryList()), // Use the CategoryList widget
          ],
        ),
      ),
    );
  }
}
