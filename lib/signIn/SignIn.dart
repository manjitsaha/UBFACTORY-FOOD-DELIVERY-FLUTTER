import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/phone_number/number.dart';
import 'package:newfigma/widgets/flagtexfiled.dart';
import 'package:newfigma/widgets/iconbutton.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(19, 5, 19, 5),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/images/Delivery.png')),
              Text('Get your delivery\nwith UBfactory',style: Style.heading,),
              const FlagTextfieldWidget(hint:'+91',),
              const SizedBox(height: 15,),
              const Center(child: Text('Or Connect with social media')),
              const SizedBox(height: 25,),
              IconButtonWidget(onPressed: (){
                Get.to(const Phone());
              },
               text: 'Continue with Google',
               textColor: ColorConstant.white,
               prefixIcon: Icons.facebook,
               height: 60,
               backgroundColor: ColorConstant.red),
              const SizedBox(height: 20,),
              IconButtonWidget(onPressed: (){},
               text: 'Continue with Facebook',
               height: 60,
               textColor: ColorConstant.white,
               prefixIcon: Icons.facebook,
               backgroundColor: ColorConstant.blue)
            
            
            ],
          ),
        ),
      ),
    );
  }
}