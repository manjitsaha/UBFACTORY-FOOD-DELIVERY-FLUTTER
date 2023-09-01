import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/otp/otp.dart';
import 'package:newfigma/phone_number/number.dart';
import 'package:newfigma/routes/AppRoutes.dart';
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
    double height= Get.height;
    double width=Get.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(19, 5, 19, 5),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage('assets/images/signin.png'),height: Get.height*0.5,),
                Text('Get your delivery\nwith UBfactory',style: Style.heading,),
                 FlagTextfieldWidget(hint:'Phone No.',),
                const SizedBox(height: 15,),

                IconButtonWidget(onPressed: (){
                  Get.to(OTPScreen());
                }, text: 'Continue', backgroundColor: ColorConstant.blue,
                textColor: ColorConstant.white,height: height*0.065,
                ),
                SizedBox(height: 15,),
               Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  //  Expanded(child: Divider(height: 2,thickness: 2,)),
                   Center(child: Text('Or Connect with social media')),
                  //  Expanded(child: Divider(thickness: 2,))
                 ],
               ),
                const SizedBox(height: 30,),
                IconButtonWidget(onPressed: (){
                  Get.to(const Phone());
                },
                 text: 'Continue with Google',
                 textColor: ColorConstant.white,
                 height: height*0.065,
                 prefixIcon: Icons.facebook,
                 backgroundColor: ColorConstant.red),
                const SizedBox(height: 15,),
                IconButtonWidget(onPressed: (){},
                 text: 'Continue with Facebook',
                //  height: 60,
                 textColor: ColorConstant.white,
                 prefixIcon: Icons.facebook,
                 height: height*0.065,
                 backgroundColor: ColorConstant.blue)
              
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}