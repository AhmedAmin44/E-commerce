import 'package:depi_final_project/core/utils/s/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final int? width;
  final String name;
  final String? imageName;
  final Color backGroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  const CustomElevatedButton({super.key, required this.textColor, required this.name, required this.backGroundColor,   this.imageName, required this.onPressed, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49.h,
      width: width?.w??344.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:backGroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))// Hex color
        ),
        child: imageName == null
            ? Center(
          child: Text( name,
            style: TextStyle(
              color: textColor,
              fontSize: 13.r,
            ),), // Center the text if no image is provided
        )
            :
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.r),
          child: Row(
            children: [
              if (imageName != null)
              Image.asset(imageName??""),
              SizedBox(width: 50.w,),
              Text(
                name,
                style: TextStyle(
                  color: textColor,
                  fontSize: 13.r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
