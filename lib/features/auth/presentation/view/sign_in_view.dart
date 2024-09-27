import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi_final_project/core/functions/navigation.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/serveces/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/customElevatedButtom.dart';
import '../widgets/customTextForm.dart';
import '../widgets/custom_sign_in.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.r, horizontal: 20.r),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Text(
                  AppStrings.signIn,
                  style: TextStyle(
                    fontSize: 23.sp, // Responsive text size
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 40.h),
              ),
              SliverToBoxAdapter(
                child: CustomSignInForm()
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 23.h),
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                      AppStrings.dontHaveAnAccount,
                      style: TextStyle(color: AppColors.black),
                    ),
                    InkWell(
                      onTap: () {
                        customNavigate(context, "/signUp");
                      },
                      child: Text(
                        AppStrings.createAccount,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h),
              ),
              SliverToBoxAdapter(
                child: Divider(color: Colors.black, height: 10.h),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h),
              ),
              SliverToBoxAdapter(
                child: CustomElevatedButton(
                  imageName: "assets/images/Apple svg.png",
                  backGroundColor: AppColors.gray,
                  name: "Continue With Apple",
                  textColor: Colors.black,
                  onPressed: () {
                    CacheHelper().saveData(key: "isLoginVisited", value: true);
                  //TODO
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h),
              ),
              SliverToBoxAdapter(
                child: CustomElevatedButton(
                  imageName: 'assets/images/Google.png',
                  backGroundColor: AppColors.gray,
                  name: "Continue With Google",
                  textColor: Colors.black,
                  onPressed: () {
                    CacheHelper().saveData(key: "isLoginVisited", value: true);
                    //TODO
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h),
              ),
              SliverToBoxAdapter(
                child: CustomElevatedButton(
                  imageName: 'assets/images/Facebook.png',
                  backGroundColor: AppColors.gray,
                  name: "Continue With Facebook",
                  textColor: Colors.black,
                  onPressed: () {
                    CacheHelper().saveData(key: "isLoginVisited", value: true);
                    //TODO
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
