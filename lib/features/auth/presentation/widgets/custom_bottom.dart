import 'package:flutter/material.dart%20%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton(
      {Key? key, this.color, required this.text, required this.onPressed, this.hight})
      : super(key: key);
  final Color? color;
  final String text;
  final VoidCallback onPressed;
  final int? hight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 49.h,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.r))),
          child: Text(
            text,
            style:TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "Poppins",
    )),
    ));
  }
}
