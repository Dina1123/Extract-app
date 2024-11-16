import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_dep/core/constants/colors.dart';
import 'package:new_dep/core/constants/routes.dart';
import 'package:new_dep/core/constants/themedata.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  void navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(AppRoute.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbarbuttonsColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                height: 150,
                width: 150),
            const SizedBox(height: 16),
            Text(
              'Text Extraction',
              style: myTheme.textTheme.titleLarge!.copyWith(
                  color: AppColors.bodyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
