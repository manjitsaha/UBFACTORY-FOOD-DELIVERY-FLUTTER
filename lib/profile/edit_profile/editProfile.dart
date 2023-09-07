import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/widgets/boxTextfield.dart';
import 'package:newfigma/widgets/button.dart';

import '../MyDetails_screen/controller/myProfile_controller.dart';

class ChangeDetailsPage extends StatefulWidget {
  const ChangeDetailsPage({super.key});

  @override
  State<ChangeDetailsPage> createState() => _ChangeDetailsPageState();
}

class _ChangeDetailsPageState extends State<ChangeDetailsPage> {
  double width=Get.width;
  double height=Get.height;
  ProfileController pc = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    backgroundColor: Colors.white,
    leading: BackButton(color: Colors.black,),
    elevation: 0,
    title: Text('Update Profile',style: TextStyle(color: ColorConstant.black),),
    ),
   body: SafeArea(child: 
   Padding(
     padding: const EdgeInsets.all(12.0),
     child: Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: BoxTextField(hint: '${pc.profileModel.value.customerWithUrl?.name}',label: 'Name',)),
        Center(child: BoxTextField(hint: '${pc.profileModel.value.customerWithUrl?.email}',label: 'Email',)),
        Center(child: BoxTextField(hint: '${pc.profileModel.value.customerWithUrl?.mobile}',label: 'Mobile Number',)),
        Center(child: BoxTextField(hint: '${pc.profileModel.value.customerWithUrl?.username}',label: 'User Name',)),
       Center(child: BoxTextField(hint: 'XXXXXXXX',label: 'Password',)),
       SizedBox(height: 50,),
       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           ButtonWidget(onPressed: (){}, text: 'Change', backgroundColor: ColorConstant.blue, textColor: ColorConstant.white,width: width*0.4,),
           ButtonWidget(onPressed: (){}, text: 'Save', backgroundColor: ColorConstant.blue, textColor: ColorConstant.white,width: width*0.4,),
        ],
       ),
       
      ],
     ),
   )),
   backgroundColor: Colors.white,
    );
  }
}