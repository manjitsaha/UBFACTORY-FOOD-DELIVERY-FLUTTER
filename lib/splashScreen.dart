import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/home/hometab.dart';
import 'package:newfigma/onboarding/onboarding.dart';
import 'package:newfigma/routes/AppRoutes.dart';
import 'package:newfigma/signIn/tabsignin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String tokenid='';
  Future getValidate() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token=sharedPreferences.getString('newtoken');
    setState(() {
      tokenid=token!;
    });
    print(tokenid);
  }

   @override
  void initState() {
   getValidate().whenComplete(() async{
    // ignore: unnecessary_null_comparison
    Timer(Duration(seconds: 2), ()=> Get.to(tokenid.length> 2 ? TabHome() : SignInLogInTab()));
    print(tokenid);
   });
    super.initState();
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