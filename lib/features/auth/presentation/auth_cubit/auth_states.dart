class AuthState {}

 class AuthInitial extends AuthState {}

 class SignUpLoadingState extends AuthState {}

 class SignUpSuccessState extends AuthState {}

 class SignUpFailureState extends AuthState {
   String errmsg;
  SignUpFailureState({required this.errmsg});
}

 class SignInLoadingState extends AuthState {}

 class SignInSuccessState extends AuthState {}
 class SignInFailureState extends AuthState{
   String errMsg;
  SignInFailureState({required this.errMsg});
} class ResetPasswordLoadingState extends AuthState {}

 class ResetPasswordSuccessState extends AuthState {}
 class ResetPasswordFailureState extends AuthState{
   String errMsg;
  ResetPasswordFailureState({required this.errMsg});
}

 class TermsAndConditionsChekBoxState extends AuthState {}

 class ObscurePasswordTextUpdateState extends AuthState {}