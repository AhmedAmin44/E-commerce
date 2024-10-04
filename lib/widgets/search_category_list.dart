import 'package:flutter/material.dart';
import 'package:test1/screens/search_detailes.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
    children: [
        _buildCategoryItem( context ,'Hoodies', 'assets/Ellipse 5.png'), // Update with your asset image
        _buildCategoryItem(context ,'Accessories', 'assets/Ellipse 5 (1).png'), // Update with your asset image
        _buildCategoryItem(context ,'Shorts', 'assets/Ellipse 5 (2).png'), // Update with your asset image
        _buildCategoryItem(context ,'Shoes', 'assets/Ellipse 5 (3).png'), // Update with your asset image
        _buildCategoryItem(context ,'Bags', 'assets/Ellipse 5 (4).png'), // Update with your asset image
      ],
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Handle item tap
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Clicked on $title')),
        );

        // You can also navigate to a new screen like this:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => SearchDetailes()),
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath), // Use AssetImage
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF272727),
                fontSize: 16,
                fontFamily: 'Circular Std',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
