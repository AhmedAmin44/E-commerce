import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/flutter_toast.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_states.dart';
import 'customTextForm.dart';
import 'custom_bottom.dart';
import 'forget_password.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (Context, state) {
          if(state is ResetPasswordSuccessState){
            // ShowToast("Check Your Email to Reset Your Password");
            customNavigateReplacement(context,"/resendPassword");
          }else if(state is ResetPasswordFailureState){ShowToast(state.errMsg);}
        }, builder: (Context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
            key: authCubit.forgotPasswordFormKey,
            child: Column(
              children: [
                TextFField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                state is ResetPasswordLoadingState
                    ? CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )
                    : CustomBotton(

                  onPressed: () {
                    if (authCubit.forgotPasswordFormKey.currentState!.validate()) {
                      authCubit.resetPasswordWithLink();
                    }
                  },
                  text: AppStrings.sendResetPasswordLink,
                ),
              ],
            )),
      );
    });
  }
}