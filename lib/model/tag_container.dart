import 'package:flutter/material.dart';
///////////////////////////////
class TagContainer extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const TagContainer({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontFamily: 'Circular Std',
              fontWeight: FontWeight.w400,
              height: 0.13,
            ),
          ),
          const SizedBox(width: 4),
          // Add your icon or any additional widget here
          Container(
            width: 16,
            height: 16,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              // Add decoration if needed
            ),
            child: Center(
              child: Icon(
                Icons.circle, // Replace with your icon
                size: 12,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
