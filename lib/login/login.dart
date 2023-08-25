import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/login/controller/loginController.dart';
import 'package:newfigma/routes/AppRoutes.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:newfigma/widgets/textfield.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isPasswordVisible = false;
  final RxBool isLoading = false.obs;

void _togglePasswordVisibility() {
  setState(() {
    _isPasswordVisible = !_isPasswordVisible;
  });
}
  LoginController loginController =LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Loging',style: Style.heading,),
              const SizedBox(height: 20,),
              const Text('Enter your emails and password'),
              const SizedBox(height: 20,),
              const Text('Email'),
               TextfieldWidget(controller:loginController.email ,hint: 'Enter your email'),
              const SizedBox(height: 20,),
              Center(
                 child: Obx(() {
                  return loginController.isLoading.value
                      ? CircularProgressIndicator()
                      : SizedBox.shrink();
                             }),
               ),
              const Text('Password'),
               Stack(alignment: Alignment.centerRight,
                children: [
                  TextfieldWidget(
                controller: loginController.password,
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
               
                const Padding(
                padding: EdgeInsets.only(left: 230),
                child: Text('Forgot Password?'),
              ),
              const SizedBox(height: 25,),
              ButtonWidget(onPressed:()async{
               loginController.isLoading.value = true;
                  
                  await loginController.loginUser();
                  loginController.isLoading.value = false;
              },
               text: 'Log In', backgroundColor: ColorConstant.backgound, 
               textColor: ColorConstant.white),
               
               const SizedBox(height: 20,),
               Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("Dont't have an account?"),
                GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.signup);
                },
                child: Text('SignUp',style: TextStyle(color: ColorConstant.backgound),)
                )
               ],),
            ],
          ),
        ),
      ),
    );
  }
}