import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/widgets/boxTextfield.dart';
import 'package:newfigma/widgets/button.dart';

import '../../core/constant/color.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  double height=Get.height;
  double width=Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(color:Colors.black,),
        title: Text('Payments',style: TextStyle(color: ColorConstant.black),),
        backgroundColor: ColorConstant.white,
        elevation: 3,
      ),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Center(child: 
          Image(image: AssetImage('assets/images/cardpay.png'))
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Card Number',style: Style.normalhead,),
                BoxTextField(hint: 'XXXX XXXX XXXX',borderRadius: 12,),
                SizedBox(height: 20,),
                Text('Expiry Date',style: Style.normalhead,),
                BoxTextField(hint: 'DD/MM/YYYY',borderRadius: 12,),
                SizedBox(height: 20,),
                Text('CVV',style: Style.normalhead,),
                BoxTextField(hint: 'XXX',borderRadius: 12,),
                SizedBox(height: 40,),
                ButtonWidget(onPressed: (){}
                , text: 'Add Card', backgroundColor: ColorConstant.blue, textColor: ColorConstant.white,height: height*0.06,)
              ],
            ),
          )
          //  LottieBuilder.asset('assets/images/nopayment.json'),
          //    Text('No Payment method added '),
          ],
        ),
      )
    );
  }
}