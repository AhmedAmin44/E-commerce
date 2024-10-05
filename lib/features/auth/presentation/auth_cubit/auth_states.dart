import 'package:firebase_auth/firebase_auth.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFailureState extends AuthState {
 final String errmsg;
 SignUpFailureState({required this.errmsg});
}

class SignInLoadingState extends AuthState {}

class SignInSuccessState extends AuthState {}

class SignInFailureState extends AuthState {
 final String errMsg;
 SignInFailureState({required this.errMsg});
}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordFailureState extends AuthState {
 final String errMsg;
 ResetPasswordFailureState({required this.errMsg});
}

class TermsAndConditionsCheckBoxState extends AuthState {}

class ObscurePasswordTextUpdateState extends AuthState {}

// New Google Sign-In States
class GoogleSignInLoadingState extends AuthState {}

class GoogleSignInSuccessState extends AuthState {
 final User user;
 GoogleSignInSuccessState(this.user);
}

class GoogleSignInFailureState extends AuthState {
 final String error;
 GoogleSignInFailureState({required this.error});
}
