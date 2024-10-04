import 'package:flutter/material.dart';
import '../model/product_card.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of columns based on screen width
    int columns = screenWidth < 600 ? 2 : 4; // 2 columns for small screens, 4 for larger

    return Scaffold(
     
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          childAspectRatio: 0.8, // Adjust as needed
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: 4, // Number of products
        itemBuilder: (BuildContext context, int index) {
          // Replace with your product data or model
          switch (index) {
            case 0:
              return ProductCard(
                imageUrl: "assets/Rectangle 8@2x.png",
                productName: 'Club Fleece Mens Jacket',
                price: '\$56.97',
              );
            case 1:
              return ProductCard(
                imageUrl: "assets/Rectangle 8@2x.png",
                productName: 'Therma Fit Puffer Jacket',
                price: '\$280.97',
              );
            case 2:
              return ProductCard(
                imageUrl: "assets/Rectangle 8@2x.png",
                productName: 'Skate Jacket',
                price: '\$150.97',
              );
            case 3:
              return ProductCard(
                imageUrl: "assets/Rectangle 8@2x.png",
                productName: 'Men\'s Workwear Jacket',
                price: '\$128.97',
              );
             
            default:
              return Container(); // Fallback for extra items
          }
        },
      ),
    );
  }
}
