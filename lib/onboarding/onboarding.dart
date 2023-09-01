import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
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
    double height =Get.height;
    double width =Get.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
      children:[
      Image(image: AssetImage('assets/images/board.png'),height: Get.height,width:Get.width,fit: BoxFit.fitWidth,),
      Positioned(
      top: 450,
      left: 60,
      child: Text('Welcome \nto our store',style:Style.onboard,textAlign: TextAlign.center,)),
      Positioned(
      top:580,
      left: 50,
      child: Text('Get your groceries in as fast as one hour',style: TextStyle(color: ColorConstant.white,fontSize: 16),)),
      const SizedBox(height: 30,),
      Positioned(
      top: 650,
      left: 20,
        child: ButtonWidget(onPressed: (){
          Get.to(SignInLogInTab());
        },
         text: 'Get Started',
          backgroundColor: ColorConstant.backgound, 
          width: 350,
          textColor: ColorConstant.white),
      )
        ]
      ),
      backgroundColor: ColorConstant.backgound,
    );
  }
}