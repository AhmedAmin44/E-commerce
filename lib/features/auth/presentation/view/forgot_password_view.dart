import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/customElevatedButtom.dart';
import '../widgets/customTextForm.dart';
import '../widgets/custom_forgetPassword_form.dart';

class FogotPasswordView extends StatelessWidget {
  const FogotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.r, horizontal: 20.r),
          child: ListView(physics: BouncingScrollPhysics(), children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    customNavigateReplacement(context, "/login");
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.gray,
                    child: Semantics(
                      label: "Back",
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Center(
              child: Text(
                AppStrings.forgotPasswordPage,
                style: TextStyle(
                    fontSize: 23.sp, // Use responsive size
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
            ),
            SizedBox(height: 40.h),
            CustomForgotPasswordForm(),
            SizedBox(height: 23.h),
          ]),
        ),
      ),
    );
  }
}
