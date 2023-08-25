import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/color.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
  super.key, 
  required this.hint, 
  this.prefixIcon,
  this.suffixIcon,
  this.controller, this.obscureText = false, this.width,
  });
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final double? width;
  

  @override
  Widget build(BuildContext context) {
     double containerWidth = width ?? Get.width * 0.95;
    double height = Get.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: Container(
        width: containerWidth,
        height: height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextFormField(
          
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
           enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
           ),
            focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
              ),
            contentPadding: const EdgeInsets.all(10),
            hintText: hint,
            hintStyle: const TextStyle(fontWeight: FontWeight.w800),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null ? Icon(suffixIcon,color: ColorConstant.black,size: 30,) : null, // Display the prefix icon if provided
          ),
        ),
      ),
    );
  }
}
