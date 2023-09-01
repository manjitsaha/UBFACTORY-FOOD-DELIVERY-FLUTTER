import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/widgets/detailInfo.dart';

class ProfileNotificationDetails extends StatefulWidget {
  const ProfileNotificationDetails({super.key});

  @override
  State<ProfileNotificationDetails> createState() => _ProfileNotificationDetailsState();
}

class _ProfileNotificationDetailsState extends State<ProfileNotificationDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: ColorConstant.black,),
        title: Text('Product Delivered',style: TextStyle(color: ColorConstant.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         DetailInfo(text1: 'Order :', text2: 'SGH-9889-9876543'),
         SizedBox(height: 20,),
         DetailInfo(text1: 'Order Date :', text2: 'August 28,2023'),
         SizedBox(height: 30,),
         Text('Dear Customer,',style: Style.normal1,),
          SizedBox(height: 30,),
          Text('Your Order has arrived at the post office at August 29,2023. Our Courier was unable to deliver the parcel to you.\n\nTo receive your parcel, please go to the nearest office and show this receipt.',style: Style.normal,),
          SizedBox(height: 30,),
          Text('Thank you,',style: Style.normal,),
          SizedBox(height: 8,),
          Text('UB,Factory',style: Style.normal,)

        ]),
      ),
    );
  }
}