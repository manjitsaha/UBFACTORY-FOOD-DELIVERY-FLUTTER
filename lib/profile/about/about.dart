import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newfigma/core/constant/color.dart';

class ProfileAbout extends StatefulWidget {
  const ProfileAbout({super.key});

  @override
  State<ProfileAbout> createState() => _ProfileAboutState();
}

class _ProfileAboutState extends State<ProfileAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text('About Us',style: TextStyle(color: ColorConstant.black),),
        backgroundColor: ColorConstant.white,
        elevation: 3,
      ),
      body: Column(
        children: [
          Lottie.asset('assets/images/about.json'),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',style: TextStyle(fontSize: 16),),
          )
        ],
      )
    );
  }
}