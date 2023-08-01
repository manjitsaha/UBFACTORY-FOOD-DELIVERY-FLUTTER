import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:newfigma/widgets/icon_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  children: [
                  Image(image: AssetImage('assets/images/profile.png')),
                  SizedBox(width: 15,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Naveen Reddy',style:TextStyle(fontSize: 17,fontWeight: FontWeight.w900),),
                      Text('naveen001@gmail.com')
                    ],
                  ),
                  SizedBox(width: 90,),
                  Icon(Icons.edit_outlined)
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
              const IconTextWidget(text: 'About', icon: Icons.arrow_forward_ios, icon1: Icons.info_outline,),
              const Divider(thickness: 2,),
              const SizedBox(height: 80,),
              ButtonWidget(onPressed: (){},
               text: 'Log Out',
               backgroundColor: const Color.fromARGB(255, 235, 233, 233), textColor: ColorConstant.backgound)
            ],
          ),
        ),
      ),
    );
  }
}