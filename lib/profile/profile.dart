import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/onboarding/onboarding.dart';
import 'package:newfigma/profile/about/about.dart';
import 'package:newfigma/profile/delivery_address/delivery_address.dart';
import 'package:newfigma/profile/edit_profile/editProfile.dart';
import 'package:newfigma/profile/order/order.dart';
import 'package:newfigma/profile/payment_method/paymentMethod.dart';
import 'package:newfigma/profile/promoCode/promoCode.dart';
import 'package:newfigma/subscription/subscription.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:newfigma/widgets/icon_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyDetails_screen/mydetails_screen.dart';
import 'notification/notification.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
var _uname;
var _uemail;
   @override
  void initState() {
    super.initState();
    _loadProfileData(); 
  }
  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   String uname =prefs.getString('username')??'';
   String uemail=prefs.getString('useremail')??'';
  
   setState(() {
     _uname=uname;
     _uemail=uemail;
   });
   print(_uemail);
   print(_uname);
  }
  @override
  Widget build(BuildContext context) {
   double width=Get.width;
   double height=Get.height;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                 Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Row(
                    children: [
                    Image(image: AssetImage('assets/images/profile.png')),
                    SizedBox(width: 15,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_uname.toString(),style:TextStyle(fontSize: 17,fontWeight: FontWeight.w900),),
                        Text(_uemail.toString(),style: TextStyle(color: ColorConstant.textGrey),)
                      ],
                    ),
                    SizedBox(width: 40,),
                    GestureDetector(
                      onTap: (){
                        Get.to(ChangeDetailsPage());
                      },
                      child: Icon(Icons.edit_outlined,size: 18,)
                    )
                  ],),
                ),
                const Divider(thickness: 1,),
                const SizedBox(height: 5,),
                 GestureDetector(
                  onTap: (){
                    Get.to(ProfileOrder());
                  },
                  child: IconTextWidget(text: 'Order', icon: Icons.arrow_forward_ios, image: AssetImage('assets/images/Orders icon.png'))),
                const SizedBox(height: 5,),
                const Divider(thickness: 1,),
                const SizedBox(height: 5,),
                GestureDetector(
                onTap: (){
                Get.to(ProfileDetailScreen());
                },
                child: IconTextWidget(text: 'My Details', icon: Icons.arrow_forward_ios, image: AssetImage('assets/images/detail.png'))),
                const SizedBox(height: 5,),
                const Divider(thickness: 1,),
                const SizedBox(height: 5,),
                GestureDetector(
                  onTap: (){
                    Get.to(ProfileDeliveryAddress());
                  },
                child: IconTextWidget(text: 'Delivery Address', icon: Icons.arrow_forward_ios, icon1: Icons.pin_drop_outlined,)),
                const SizedBox(height: 5,),
                const Divider(thickness: 1,),
                const SizedBox(height: 5,),
                GestureDetector(
                onTap: (){
                  Get.to(PaymentMethod());
                },
                child: IconTextWidget(text: 'Payment Methods', icon: Icons.arrow_forward_ios, icon1: Icons.credit_card,)),
                const SizedBox(height: 5,),
                const Divider(thickness: 1,),
                const SizedBox(height: 5,),
                GestureDetector(
                onTap: (){
                  Get.to(PromoCode());
                },
                child: IconTextWidget(text: 'Promo Code', icon: Icons.arrow_forward_ios, icon1: Icons.local_offer,)),
                const SizedBox(height: 5,),
                const Divider(thickness: 1,),
                const SizedBox(height: 5,),
                GestureDetector(
                  onTap: (){
                    Get.to(Notifications());
                  },
                child: IconTextWidget(text: 'Notification', icon: Icons.arrow_forward_ios, icon1: Icons.notifications_outlined,)),
                const SizedBox(height: 5,),
                const Divider(thickness: 1,),
                const SizedBox(height: 5,),
                GestureDetector(
                onTap: () {
                  Get.to(const Subscription());
                },
                child: const IconTextWidget(text: 'Subscription', icon: Icons.arrow_forward_ios, icon1: Icons.subscriptions_outlined,)),
                const SizedBox(height: 5,),
                const Divider(thickness: 1,),
                const SizedBox(height: 5,),
                 GestureDetector(
                  onTap: (){
                    Get.to(ProfileAbout());
                  },
                  child: IconTextWidget(text: 'About', icon: Icons.arrow_forward_ios, icon1: Icons.info_outline,)),
                 const SizedBox(height: 5,),
                const Divider(thickness: 1,),
                const SizedBox(height: 20,),
                ButtonWidget(onPressed: (){
                  setState(() async {
                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.setString('newtoken', '');
                Get.to(OnBoarding());
                  });
                },
                 text: 'Log Out',height: height*0.06,
                 backgroundColor:ColorConstant.backgound, textColor: ColorConstant.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}