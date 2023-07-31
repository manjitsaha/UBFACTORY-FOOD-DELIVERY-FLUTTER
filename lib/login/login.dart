import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/home/hometab.dart';
import 'package:newfigma/signup/signup.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:newfigma/widgets/textfield.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 130, 15, 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Loging',style: Style.heading,),
              const SizedBox(height: 20,),
              const Text('Enter your emails and password'),
              const SizedBox(height: 20,),
              const Text('Email'),
              const TextfieldWidget(hint: 'Enter your email'),
              const SizedBox(height: 20,),
              const Text('Password'),
              const TextfieldWidget(hint: 'Enter your password',suffixIcon: Icons.remove_red_eye,),
              const Padding(
                padding: EdgeInsets.only(left: 230),
                child: Text('Forgot Password?'),
              ),
              const SizedBox(height: 25,),
              ButtonWidget(onPressed:(){
                Get.to(const TabHome());
              } ,
               text: 'Log In', backgroundColor: ColorConstant.backgound, 
               textColor: ColorConstant.white),
               const SizedBox(height: 20,),
               Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("Dont't have an account?"),
                GestureDetector(
                onTap: (){
                  Get.to(const SignUp());
                },
                child: Text('SignUp',style: TextStyle(color: ColorConstant.backgound),)
                )
               ],)
            ],
          ),
        ),
      ),
    );
  }
}