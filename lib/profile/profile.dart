import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/onboarding/onboarding.dart';
import 'package:newfigma/routes/AppRoutes.dart';
import 'package:newfigma/subscription/subscription.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:newfigma/widgets/icon_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  //  print(uname);
  //  print(uemail);
   setState(() {
     _uname=uname;
     _uemail=uemail;
   });
   print(_uemail);
   print(_uname);
  }
  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
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
                        Text(_uemail.toString())
                      ],
                    ),
                    SizedBox(width: 40,),
                    GestureDetector(
                      child: Icon(Icons.edit_outlined)
                    )
                  ],),
                ),
                const Divider(thickness: 2,),
                const SizedBox(width: 10,),
                const IconTextWidget(text: 'Order', icon: Icons.arrow_forward_ios, icon1: Icons.shopping_bag_outlined,),
                const Divider(thickness: 2,),
                const IconTextWidget(text: 'My Details', icon: Icons.arrow_forward_ios, icon1: Icons.card_membership_outlined),
                const Divider(thickness: 2,),
                const IconTextWidget(text: 'Dilivery Address', icon: Icons.arrow_forward_ios, icon1: Icons.pin_drop_outlined,),
                const Divider(thickness: 2,),
                const IconTextWidget(text: 'Payment Methods', icon: Icons.arrow_forward_ios, icon1: Icons.credit_card,),
                const Divider(thickness: 2,),
                const IconTextWidget(text: 'Promo Code', icon: Icons.arrow_forward_ios, icon1: Icons.local_offer,),
                const Divider(thickness: 2,),
                const IconTextWidget(text: 'Notification', icon: Icons.arrow_forward_ios, icon1: Icons.notifications_outlined,),
                const Divider(thickness: 2,),
                GestureDetector(
                onTap: () {
                  Get.to(const Subscription());
                },
                child: const IconTextWidget(text: 'Subscription', icon: Icons.arrow_forward_ios, icon1: Icons.subscriptions_outlined,)),
                const Divider(thickness: 2,),
                const IconTextWidget(text: 'About', icon: Icons.arrow_forward_ios, icon1: Icons.info_outline,),
                const Divider(thickness: 2,),
                const SizedBox(height: 50,),
                ButtonWidget(onPressed: (){
                  setState(() async {
                final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.setString('newtoken', '');
                Get.to(OnBoarding());
                  });
                },
                 text: 'Log Out',
                 backgroundColor:ColorConstant.backgound, textColor: ColorConstant.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}