import 'package:depi_final_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/text_style.dart';


class TextSpacerText extends StatelessWidget {
  const TextSpacerText(
      {super.key, required this.leadingText, required this.textPress,});
  final String leadingText;
  final void Function()? textPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          leadingText,
          style: TextStyle(fontWeight: FontWeight.bold,color:AppColors.primaryColor,fontSize: 16.sp ),
        ),
        const Spacer(),
        TextButton(
            onPressed: textPress,
            child: Text(
              " See All",
              style: TextStyles.font16BlackW500,
            ))
      ],
    );
  }
}
