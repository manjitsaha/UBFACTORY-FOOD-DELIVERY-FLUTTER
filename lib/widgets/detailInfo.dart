import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/profile/MyDetails_screen/controller/myProfile_controller.dart';

class DetailInfo extends StatelessWidget {
  final String text1;
  final String text2;
  final double? textSize1; 
  final double? textSize2; 

  DetailInfo({
    Key? key,
    required this.text1,
    required this.text2,
    this.textSize1, 
    this.textSize2, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController pc= ProfileController();
     final profile = pc.profileModel.value.customerWithUrl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: textSize1 ?? 18, 
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 10),
        
        Text(
          text2,
          style: TextStyle(
            fontSize: textSize2 ?? 16, 
            color: ColorConstant.textGrey,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
