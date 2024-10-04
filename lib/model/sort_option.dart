import 'package:flutter/material.dart';

class SortOption extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;  // Callback for tap event

  const SortOption({
    Key? key,
    required this.text,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,  // Detect tap event
      child: Container(
        width: 342,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 34),
        decoration: ShapeDecoration(
          color: isActive ? Color(0xFF8E6CEE) : Color(0xFFF4F4F4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Color(0xFF272727),
            fontSize: 16,
            fontFamily: 'Circular Std',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
