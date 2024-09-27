
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        customNavigateReplacement(context, "/forgotPassword");
      },
      child: Align(alignment: Alignment.centerRight,
        child: Text(
          AppStrings.forgotPassword,
          style:  TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.red,
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}
