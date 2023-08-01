import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/home/hometab.dart';
import 'package:newfigma/widgets/button.dart';

class OrderPlace extends StatefulWidget {
  const OrderPlace({super.key});

  @override
  State<OrderPlace> createState() => _OrderPlaceState();
}

class _OrderPlaceState extends State<OrderPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 140,),
            const Center(child: Image(image: AssetImage('assets/images/place.png'))),
            const SizedBox(height: 60,),
            Text('Your Order has been\naccepted',style: Style.heading,textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
            const Text('Your items has been placed and is on\nits way to being processed',style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,),
            const SizedBox(height: 50,),
            ButtonWidget(onPressed: (){},
             text: 'Track Order', 
             backgroundColor: ColorConstant.backgound, textColor: ColorConstant.white),
             ButtonWidget(onPressed: (){
              Get.to(const TabHome());
             },
              text: 'Back to home', backgroundColor: ColorConstant.white, textColor: ColorConstant.black)
          ],
        ),
      ),
    );
  }
}