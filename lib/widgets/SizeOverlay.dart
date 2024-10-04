import 'package:flutter/material.dart';

class SizeOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // You can set the height as needed
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          // Sort by Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Clear',
                style: TextStyle(
                  color: Color(0xFF272727),
                  fontSize: 16,
                  fontFamily: 'Circular Std',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Sort by',
                style: TextStyle(
                  color: Color(0xFF272727),
                  fontSize: 24,
                  fontFamily: 'Gabarito',
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context); // Close the modal
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          // Sort Options
          _buildSortOption('Recommended', isSelected: true),
          _buildSortOption('Newest'),
          _buildSortOption('Lowest - Highest Price'),
          _buildSortOption('Highest - Lowest Price'),
        ],
      ),
    );
  }

  // Helper to build each sort option row
  Widget _buildSortOption(String title, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF8E6CEE) : Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xFF272727),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
