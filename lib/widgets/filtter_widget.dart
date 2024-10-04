import 'package:flutter/material.dart';
import 'package:test1/model/tag_button.dart';
//////////////////

class FilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 321,
      height: 27,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TagButton(
            text: '2',
            backgroundColor: const Color(0xFF8E6CEE),
            textColor: Colors.white,
            isActive: true,
          ),
          const SizedBox(width: 4),
          TagButton(
            text: 'On Sale',
            backgroundColor: const Color(0xFFF4F4F4),
            textColor: const Color(0xFF272727),
          ),
          const SizedBox(width: 4),
          TagButton(
            text: 'Price',
            backgroundColor: const Color(0xFF8E6CEE),
            textColor: Colors.white,
            isActive: true,
          ),
          const SizedBox(width: 4),
          TagButton(
            text: 'Sort by',
            backgroundColor: const Color(0xFFF4F4F4),
            textColor: const Color(0xFF272727),
          ),
          const SizedBox(width: 4),
          TagButton(
            text: 'Men',
            backgroundColor: const Color(0xFF8E6CEE),
            textColor: Colors.white,
            isActive: true,
          ),
        ],
      ),
    );
  }
}
