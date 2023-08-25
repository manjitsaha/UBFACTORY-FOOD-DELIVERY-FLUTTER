import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/routes/AppRoutes.dart';
import 'package:newfigma/signIn/tabsignin.dart';
import 'package:newfigma/widgets/button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage('assets/images/onboard.png')),
          Text('Welcome \nto our store',style:Style.onboard,textAlign: TextAlign.center,),
          Text('Get your groceries in as fast as one hour',style: TextStyle(color: ColorConstant.white,fontSize: 16),),
          const SizedBox(height: 30,),
          ButtonWidget(onPressed: (){
            Get.to(SignInLogInTab());
          },
           text: 'Get Started',
            backgroundColor: ColorConstant.lightGreen, 
            width: 350,
            textColor: ColorConstant.white)
        ],
      ),
      backgroundColor: ColorConstant.backgound,
    );
  }
}