import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/home/hometab.dart';
import 'package:newfigma/profile/notification/notificationDetails.dart';
import 'package:newfigma/widgets/button.dart';

import '../../core/constant/color.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    double height=Get.height;
    double width =Get.width;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        title: Text('Notification',style: TextStyle(color: ColorConstant.black),),
        backgroundColor: ColorConstant.white,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
          GestureDetector(
            onTap: (){
              Get.to(ProfileNotificationDetails());
            },
            child: Material(
              elevation: 2,
              child: Container(
                height:height*0.1 ,
                decoration: BoxDecoration(
                  color: Colors.grey[200]
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.notifications_on_outlined,size: 26,),
                      SizedBox(width: 25,),
                      Text('Order No. 1278GJH7 is Deleverd Today.\nHope You Like Our Service',style: Style.normal,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Get.to(ProfileNotificationDetails());
            },
            child: Material(
              elevation: 2,
              child: Container(
                height:height*0.1 ,
                decoration: BoxDecoration(
                  color: Colors.grey[200]
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.notifications_on_outlined,size: 26,),
                      SizedBox(width: 25,),
                      Text('Order No. 1278GJH7 is Deleverd Today.\nHope You Like Our Service',style: Style.normal,)
                    ],
                  ),
                ),
              ),
            ),
          ),
           SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Get.to(ProfileNotificationDetails());
            },
            child: Material(
              elevation: 2,
              child: Container(
                height:height*0.1 ,
                decoration: BoxDecoration(
                  color: Colors.grey[200]
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.notifications_on_outlined,size: 26,),
                      SizedBox(width: 25,),
                      Text('Order No. 1278GJH7 is Deleverd Today.\nHope You Like Our Service',style: Style.normal,)
                    ],
                  ),
                ),
              ),
            ),
          ),
           SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Get.to(ProfileNotificationDetails());
            },
            child: Material(
              elevation: 2,
              child: Container(
                height:height*0.1 ,
                decoration: BoxDecoration(
                  color: Colors.grey[200]
                  
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(Icons.notifications_on_outlined,size: 26,),
                      SizedBox(width: 25,),
                      Text('Order No. 1278GJH7 is Deleverd Today.\nHope You Like Our Service',style: Style.normal,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          ]
        ),
      ),
    );
  }
}