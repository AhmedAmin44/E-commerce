import 'package:depi_final_project/features/auth/presentation/view/sign_up_view.dart';
import 'package:depi_final_project/core/routers/routers_name.dart';
import 'package:depi_final_project/features/home/model/new_in_model.dart';
import 'package:depi_final_project/features/home/model/top_selling_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/accessories/ui/accessories_screen.dart.dart';
import '../../features/auth/presentation/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/view/forgot_password_view.dart';
import '../../features/auth/presentation/view/resend_password_view.dart';
import '../../features/auth/presentation/view/sign_in_view.dart';
import '../../features/clothes/_views/bags/ui/bags_screen.dart';
import '../../features/clothes/_views/hoodies/ui/hoodies_screen.dart';
import '../../features/clothes/_views/shoes/ui/shoes_screen.dart';
import '../../features/clothes/_views/shorts/ui/shorts_screen.dart';
import '../../features/home/presentation/view/home_screen.dart';
import '../../features/home/presentation/widgets/Topselling_Widgets/top_selling_view.dart';
import '../../features/home/presentation/widgets/Topselling_Widgets/top_selling_view.dart';
import '../../features/home/presentation/widgets/newIn_widgets/new_in_details_view.dart';
import '../../features/splash/splash_view.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: Routes.splashScreen,
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: Routes.loginScreen,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: LoginScreen(),
    ),
  ),
  GoRoute(
    path: Routes.signUpScreen,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: SignUpScreen(),
    ),
  ),
  GoRoute(
    path: Routes.forgotPasswordScreen,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: FogotPasswordView(),
    ),
  ),
  GoRoute(
    path: Routes.resendPasswordScreen,
    builder: (context, state) => ResendPasswordScreen(),
  ),
  GoRoute(
    path: Routes.homeScreen,
    builder: (context, state) => HomeScreen(),
  ),



  GoRoute(
    path:Routes.TopSellingDetailsView,
    builder: (context, state) => TopSellingDetailsView(model: state.extra as TopSellingModel,),
  ),
 GoRoute(
    path:Routes.NewInDetailsView,
    builder: (context, state) => NewInDetailsView(model: state.extra as NewInModel,),
  ),



  GoRoute(
    path: Routes.hoodiesScreen,
    builder: (context, state) => HoodiesScreen(),
  ),
  GoRoute(
    path: Routes.shortsScreen,
    builder: (context, state) => ShortsScreen(),
  ),
  GoRoute(
    path: Routes.shoesScreen,
    builder: (context, state) => ShoesScreen(),
  ),
  GoRoute(
    path: Routes.bagsScreen,
    builder: (context, state) => BagsScreen(),
  ),
  GoRoute(
    path: Routes.accessoriesScreen,
    builder: (context, state) => AccessoriesScreen(),
  ),
]);
