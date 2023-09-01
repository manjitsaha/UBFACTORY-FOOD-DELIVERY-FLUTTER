import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/color.dart';

class PromoCode extends StatefulWidget {
  const PromoCode({super.key});

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        title: Text('Promo Code',style: TextStyle(color: ColorConstant.black),),
        backgroundColor: ColorConstant.white,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            Center(child: Image(image: AssetImage('assets/images/pp.jpg'),height: 300,)),
            Image(image: AssetImage('assets/images/pp2.png'),height: 100,),
            Image(image: AssetImage('assets/images/pp3.png'),height: 250,)
        //   Lottie.asset('assets/images/promo.json',height: 250),
        //   SizedBox(height: 15,),
        //   Center(
        //   child: Text('No Promo Code Available'),
        // ),
          ],
        ),
      )
    );
  }
}