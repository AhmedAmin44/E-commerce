import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../core/functions/navigation.dart';
import '../../core/utils/s/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    customDelay(context, "/login");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
            child: ElasticIn(
          animate: true,
          duration: Duration(seconds: 3),
          child: Container(
            child: Image.asset("assets/images/splash_photo.png"),
          ),
        )),
      ),
    );
  }
}

void customDelay(context, path) {
  Future.delayed(
    const Duration(seconds: 6),
    () {
      customNavigateReplacement(context, path);
    },
  );
}
