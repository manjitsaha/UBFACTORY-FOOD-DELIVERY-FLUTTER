import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      Get.to(const OnBoarding());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgound,
      body: const Center(
        child: Stack(
          children: [
            Center(child: Image(image: AssetImage('assets/images/splash1.png'))),
            Positioned(
            top: 360,
            right: 50,
            child: Image(image: AssetImage('assets/images/splash2.png'))
            )
          ],
        ),
      )
    );
  }
}