import 'package:flutter/material.dart';
//////////////////////////////
class TagButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final bool isActive;

  const TagButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.isActive = false,
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
          Icon(
            isActive ? Icons.check_circle : Icons.circle,
            size: 16,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
