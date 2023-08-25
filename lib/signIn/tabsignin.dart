import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/login/login.dart';
import 'package:newfigma/signup/signup.dart';

class SignInLogInTab extends StatefulWidget {
  @override
  _SignInLogInTabState createState() => _SignInLogInTabState();
}

class _SignInLogInTabState extends State<SignInLogInTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: Text('Welcome\nto UB Factory!!!',style:Style.heading ,),
            ),
            SizedBox(height: 40,),
            TabBar(
              labelColor: ColorConstant.black,
              indicator: BoxDecoration(color: ColorConstant.backgound,
              borderRadius: BorderRadius.circular(22)
              ),
              controller: _tabController,
              tabs: [
                Tab(text: 'SignIn',), // Empty tabs without text
                Tab(text: 'LogIn',),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SignUp(),
                  LogIn()
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
