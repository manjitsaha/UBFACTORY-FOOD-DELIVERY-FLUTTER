import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/routes/AppRoutes.dart';
import 'package:newfigma/widgets/flagtexfiled.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){
                Get.back();
              }, icon: const Icon(Icons.arrow_back_ios)),
              const SizedBox(height: 100,),
              Text('Enter your mobile number',style: Style.heading,),
              const SizedBox(height: 20,),
              const Text('Mobile Number'),
              const FlagTextfieldWidget(hint: '+91'),
              Padding(
                padding: const EdgeInsets.fromLTRB(250, 100, 30, 50),
                child: FloatingActionButton(onPressed: (){
                  Get.toNamed(AppRoutes.otp);
                },
                backgroundColor: ColorConstant.backgound,
                child:const Icon(Icons.arrow_forward_ios) ,
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}