import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/flutter_toast.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_states.dart';
import 'customTextForm.dart';
import 'custom_bottom.dart';
import 'forget_password.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(listener: (Context, state) {
      if (state is SignInSuccessState) {
        FirebaseAuth.instance.currentUser!.emailVerified == true
            ? customNavigateReplacement(context, "/home")
            : ("Verify your account");
      } else if (state is SignInFailureState) {
        ShowToast(state.errMsg);
      }
    }, builder: (Context, state) {
      return Form(
          key: authCubit.signInFormKey,
          child: Column(
            children: [
              TextFField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              TextFField(
                labelText: AppStrings.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                obscureText: authCubit.obscurePasswordTextValue,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              SizedBox(
                height: 16,
              ),
              ForgetPassword(),
              SizedBox(
                height: 25.h,
              ),
              state is SignInLoadingState
                  ? CircularProgressIndicator(
                color: AppColors.primaryColor,
              )
                  : CustomBotton(
                onPressed: () {
                  if (authCubit.signInFormKey.currentState!.validate()) {
                    authCubit.signInWithEmailAndPassword();
                  }
                },
                text: "Continue",
              ),
            ],
          ));
    });
  }
}