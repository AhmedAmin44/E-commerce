import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/functions/flutter_toast.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_states.dart';
import 'customTextForm.dart';
import 'custom_bottom.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (Context, state) {
          if(state is SignUpSuccessState){
            ShowToast("Successfuly, Chek Your Email To Verify Account");
            customNavigateReplacement(context, "/login");
          }else if(state is SignUpFailureState){
            ShowToast(state.errmsg);
          }
        },
        builder: (Context, state) {
          return Form(
              key:authCubit.signUpFormKey,
              child: Column(
                children: [
                  TextFField(
                    labelText: AppStrings.fristName,
                    onChanged: (firstName) {
                      authCubit.
                      firstName
                      =
                          firstName;
                    },
                  ),
                  TextFField(
                    labelText: AppStrings.lastName,
                    onChanged: (lastName) {
                      authCubit
                          .lastName = lastName;
                    },
                  ),
                  TextFField(
                    labelText: AppStrings.emailAddress,
                    onChanged: (emailAddress) {
                      authCubit
                          .emailAddress =
                          emailAddress;
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
                    height: 88,
                  ),
                  state is SignUpLoadingState?CircularProgressIndicator(color: AppColors.primaryColor,):
                  CustomBotton(
                    color: AppColors.primaryColor,
                    onPressed: () {
                      if (authCubit.signUpFormKey.currentState!.validate()) {
                          authCubit.signUpWithEmailAndPassword();
                      }
                    },
                    text: AppStrings.signUp,
                  ),
                ],
              ));
        });
  }
}