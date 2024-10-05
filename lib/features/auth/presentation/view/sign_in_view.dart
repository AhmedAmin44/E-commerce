import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi_final_project/core/functions/navigation.dart';
import 'package:depi_final_project/core/database/cache/cache_helper.dart';
import 'package:depi_final_project/core/utils/app_colors.dart';
import 'package:depi_final_project/core/utils/app_strings.dart';
import 'package:depi_final_project/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:depi_final_project/features/auth/presentation/auth_cubit/auth_states.dart';
import '../widgets/customElevatedButtom.dart';
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
              SliverToBoxAdapter(child: CustomSignInForm()),
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
                    //TODO: Add Apple Sign-In Logic
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h),
              ),
              // Google Sign-In Button
              SliverToBoxAdapter(
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is GoogleSignInSuccessState) {
                      // Save the login visit and navigate to the home screen
                      CacheHelper()
                          .saveData(key: "isLoginVisited", value: true);
                      customNavigate(context, '/home');
                    } else if (state is GoogleSignInFailureState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Google Sign-In Failed: ${state.error}')),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is GoogleSignInLoadingState) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ));
                    }
                    return CustomElevatedButton(
                      imageName: 'assets/images/Google.png',
                      backGroundColor: AppColors.gray,
                      name: "Continue With Google",
                      textColor: Colors.black,
                      onPressed: () {
                        context.read<AuthCubit>().signInWithGoogle();
                      },
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20.h),
              ),
              // Facebook Sign-In Button

              SliverToBoxAdapter(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is FacebookSignInSuccessState) {
                  // Handle successful sign-in (e.g., navigate to another page)
                  Navigator.pushNamed(context, '/home');
                } else if (state is FacebookSignInFailureState) {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              builder: (context, state) {
                if (state is FacebookSignInLoadingState) {
                  // Show loading indicator while signing in
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.primaryColor),
                  );
                }

                // Default state (when not loading or in an error state)
                return CustomElevatedButton(
                  imageName: 'assets/images/Facebook.png',
                  backGroundColor: AppColors.gray,
                  name: "Continue With Facebook",
                  textColor: Colors.black,
                  onPressed: () {
                    CacheHelper().saveData(key: "isLoginVisited", value: true);
                    context.read<AuthCubit>().signInWithFacebook();
                  },
                );
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
