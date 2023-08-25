import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/login/login.dart';
import 'package:newfigma/signup/controller/registerController.dart';

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
  bool _isPasswordVisible = false;

void _togglePasswordVisibility() {
  setState(() {
    _isPasswordVisible = !_isPasswordVisible;
  });
}
  RegistrationController registrationController = RegistrationController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign Up',style: Style.heading,),
                const SizedBox(height: 10,),
                const Text('Enter your credentials to continue'),
                const SizedBox(height: 15,),
                const Text('Username'),
                 TextfieldWidget(controller: registrationController.name,hint: 'Enter your Username'),
                const SizedBox(height: 15,),
                const Text('Phone Number'),
                 TextfieldWidget(controller: registrationController.mobile,hint: 'Enter your Phone Number'),
                const SizedBox(height: 15,),
                const Text('Email'),
                 TextfieldWidget(controller: registrationController.email,hint: 'Enter your Email'),
                const SizedBox(height: 15,),
                const Text('username'),
                 TextfieldWidget(controller: registrationController.username,hint: 'Enter your Role'),
                const SizedBox(height: 15,),
                const Text('Password'),
                Stack(alignment: Alignment.centerRight,
                children: [
                  TextfieldWidget(
                controller: registrationController.password,
                hint: 'Enter your password',
                
                obscureText: !_isPasswordVisible,
                ),
                IconButton(
                  onPressed: _togglePasswordVisibility,
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                ],),

                
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
                  registrationController.registerUser();
                },
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
                 ],),
                Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))            
              ],
            ),
          ),
        ),
 
      ));
  }
}