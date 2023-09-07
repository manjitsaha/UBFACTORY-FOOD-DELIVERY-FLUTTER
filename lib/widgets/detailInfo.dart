import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/profile/MyDetails_screen/controller/myProfile_controller.dart';

class DetailInfo extends StatelessWidget {
  final String text1;
  final String? text3;
  final String text2;
  final double? textSize1;
  final double? textSize2;
  final FontWeight? fontWeight1; // Optional fontWeight for text1
  final FontWeight? fontWeight3; // Optional fontWeight for text3

  DetailInfo({
    Key? key,
    required this.text1,
    required this.text2,
    this.textSize1,
    this.textSize2,
    this.text3,
    this.fontWeight1, // Optional parameter for text1
    this.fontWeight3, // Optional parameter for text3
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController pc = ProfileController();
    final profile = pc.profileModel.value.customerWithUrl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: textSize1 ?? 18,
                fontWeight: fontWeight1 ?? FontWeight.w500, // Use optional fontWeight1
              ),
              textAlign: TextAlign.start,
            ),
            if (text3 != null) // Check if text3 is provided
              Text(
                text3!,
                style: TextStyle(
                  fontSize: textSize1 ?? 18,
                  fontWeight: fontWeight3 ?? FontWeight.w500, // Use optional fontWeight3
                ),
                textAlign: TextAlign.start,
              ),
          ],
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
