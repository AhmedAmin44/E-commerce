import 'package:flutter/material.dart';
import '../model/tag_container.dart';

class ResponsiveTagRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8, // Responsive width
      height: 27,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TagContainer(
            text: '2',
            backgroundColor: Color(0xFF8E6CEE),
            textColor: Colors.white,
          ),
          const SizedBox(width: 4),
          TagContainer(
            text: 'On Sale',
            backgroundColor: Color(0xFFF4F4F4),
            textColor: Color(0xFF272727),
          ),
          const SizedBox(width: 4),
          TagContainer(
            text: 'Price',
            backgroundColor: Color(0xFF8E6CEE),
            textColor: Colors.white,
          ),
          const SizedBox(width: 4),
          TagContainer(
            text: 'Sort by',
            backgroundColor: Color(0xFFF4F4F4),
            textColor: Color(0xFF272727),
          ),
          const SizedBox(width: 4),
          TagContainer(
            text: 'Men',
            backgroundColor: Color(0xFF8E6CEE),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
