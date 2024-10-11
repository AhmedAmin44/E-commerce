import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../core/database/cache/cache_helper.dart';
import '../../core/functions/navigation.dart';
import '../../core/serveces/service_locator.dart';
import '../../core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isLoginVisited =
      CacheHelper().getData(key: "isLoginVisited") ?? false;

  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds for animation, then proceed to navigation
    Future.delayed(const Duration(seconds: 3), () {
      if (isLoginVisited) {
        customDelay(context, "/home");
      } else {
        customDelay(context, "/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
          customNavigateReplacement(context, "/home");
        },
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(
            child: ElasticIn(
              animate: true,
              duration: const Duration(seconds: 2),
              child: Container(
                child: Image.asset("assets/images/auth_images/splash_photo.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom delay for navigating after the splash animation
void customDelay(context, path) {
  Future.delayed(
    const Duration(seconds: 3), // Add delay for navigation
    () {
      customNavigateReplacement(context, path);
    },
  );
}
