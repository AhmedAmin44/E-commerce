import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/text_style.dart';

class ItemCategorie extends StatelessWidget {
  const ItemCategorie(
      {super.key,
      required this.imagePath,
      required this.categorieText,
      required this.onPress});
  final String categorieText;
  final String imagePath;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          CircleAvatar(radius: 36.r,
            child: Image.asset(
              imagePath,
              width: 70.w,
              height: 70.h,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            categorieText,
            style: TextStyles.font12BlackW500,
          )
        ],
      ),
    );
  }
}
