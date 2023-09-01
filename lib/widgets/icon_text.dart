import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constant/color.dart';

class IconTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final IconData? icon1;
  final Color iconColor;
  final double iconSize;
  final TextStyle textStyle;
  final MainAxisAlignment mainAxisAlignment;
  final ImageProvider? image; // Optional image variable

  const IconTextWidget({
    super.key,
    required this.text,
    required this.icon,
    this.iconColor = Colors.black,
    this.iconSize = 20.0,
    this.textStyle = const TextStyle(fontSize: 16, color: Color.fromARGB(255, 43, 42, 42)),
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.icon1,
    this.image, // Optional image
  });

  @override
  Widget build(BuildContext context) {
    double height= Get.height;
    return Material(
      elevation: 3,
      child: Container(
        height: height*0.05,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(4, 6, 4, 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (image != null)
                    Image(
                      image: image!,
                      height: 16,
                     
                      color: iconColor,
                    ),
                  
                  if(icon1 != null)Icon(
                    icon1,
                    color: iconColor,
                    size: iconSize,
                  ),
                  const SizedBox(width: 15,),
                  Text(
                    text,
                    style: TextStyle(fontSize: 15, color: ColorConstant.black),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
