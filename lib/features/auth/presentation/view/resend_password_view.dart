import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/customElevatedButtom.dart';

class ResendPasswordScreen extends StatelessWidget {
  const ResendPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/auth_images/resendPassword.png"),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "We Sent you an Email to reset",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Your Password",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20.sp),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomElevatedButton(
              width: 159,
              textColor: Colors.white,
              name: 'Rerurn to Login',
              backGroundColor: AppColors.primaryColor,
              onPressed: () {
                customNavigate(context, "/login");
              },
            ),
          ],
        )),
      ),
    );
  }
}
