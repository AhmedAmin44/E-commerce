import 'package:depi_final_project/features/auth/presentation/view/sign_up_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/view/forgot_password_view.dart';
import 'features/auth/presentation/view/resend_password_view.dart';
import 'features/auth/presentation/view/sign_in_view.dart';
import 'features/home/presentation/view/home_view.dart';
import 'features/splash/splash_view.dart';

final GoRouter routers = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
      path: "/login",
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: LoginScreen(),
          )),
  GoRoute(
      path: "/signUp",
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: SignUpScreen(),
          )),
  GoRoute(
path: "/forgotPassword",
builder: (context, state) => BlocProvider(
create: (context) => AuthCubit(), child: FogotPasswordView(),
  ),),
  GoRoute(
    path: "/resendPassword",
    builder: (context, state) => ResendPasswordScreen(),
  ),
  GoRoute(
    path: "/home",
    builder: (context, state) => HomeScreen(),
  ),
]);
