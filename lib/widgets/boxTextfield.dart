import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/color.dart';

class BoxTextField extends StatelessWidget {
  const BoxTextField({
    Key? key,
    required this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.showBorder = true, 
    this.controller,
    this.obscureText = false,
    
  }) : super(key: key);

  final String hint;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? borderColor;
  final bool showBorder;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    double finalWidth = width ?? Get.width * 0.9;
    double finalHeight = height ?? Get.height * 0.062;

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            
          Container(
            width: finalWidth,
            height: finalHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 20),
              color: Color.fromARGB(255, 235, 235, 235),
              border: showBorder
                  ? Border.all(
                      color: borderColor ?? Color.fromARGB(255, 227, 227, 227),
                    )
                  : null,
            ),
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
                hintText: hint,
                hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                prefixIcon: prefixIcon != null
                    ? Icon(prefixIcon, color: Colors.black,)
                    : null,
                suffixIcon: suffixIcon != null
                    ? Icon(
                        suffixIcon,
                        color: ColorConstant.black,
                        size: 30,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
