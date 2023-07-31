import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/login/login.dart';

import '../core/constant/color.dart';
import '../core/style/style.dart';
import '../widgets/button.dart';
import '../widgets/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 130, 15, 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign Up',style: Style.heading,),
              const SizedBox(height: 15,),
              const Text('Enter your credentials to continue'),
              const SizedBox(height: 20,),
              const Text('Username'),
              const TextfieldWidget(hint: 'Enter your Username'),
              const SizedBox(height: 20,),
              const Text('Email'),
              const TextfieldWidget(hint: 'Enter your Email'),
              const SizedBox(height: 20,),
              const Text('Password'),
              const TextfieldWidget(hint: 'Enter your password',suffixIcon: Icons.remove_red_eye,),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const Text('By continuing you agree to our'),
                  Text('Terms and Services',style: TextStyle(color: ColorConstant.backgound),)
                ],
              ),
              const Text('and Privacy Policy'),
              const SizedBox(height: 25,),
              ButtonWidget(onPressed:(){
                Get.to(const LogIn());
              } ,
               text: 'Sign Up', backgroundColor: ColorConstant.backgound, 
               textColor: ColorConstant.white),
               const SizedBox(height: 20,),
               Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("Already have an account?"),
                GestureDetector(
                onTap: (){
                  Get.to(const LogIn());
                },
                child: Text('SignIn',style: TextStyle(color: ColorConstant.backgound),)
                )
               ],)
            ],
          ),
        ),
 
      ));
  }
}