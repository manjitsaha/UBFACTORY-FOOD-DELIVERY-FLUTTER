import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/location/location.dart';
import 'package:newfigma/widgets/textfield.dart';

import '../core/constant/color.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Get.back();
                }, icon: const Icon(Icons.arrow_back_ios)),
                const SizedBox(height: 100,),
                Text('Enter your 4-digit code',style: Style.heading,),
                const SizedBox(height: 20,),
                const Text('Code'),
                const TextfieldWidget(hint: '- - - -'),
                const SizedBox(height: 60,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Resend Code',style: TextStyle(fontSize: 18,color: ColorConstant.backgound),),
                    FloatingActionButton(onPressed: (){
                      Get.to(const Location());
                },
                elevation: 0,
                backgroundColor: ColorConstant.backgound,
                child:const Icon(Icons.arrow_forward_ios) ,
                ),
                  ],
                )
                

          
          
              ],
            ),
          ),
      ),
    );
  }
}