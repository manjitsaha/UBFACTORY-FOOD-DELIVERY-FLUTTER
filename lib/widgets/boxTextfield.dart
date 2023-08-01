import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/color.dart';

class BoxTextField extends StatelessWidget {
  const BoxTextField({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.height,
  });

  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    double finalWidth = width ?? Get.width * 0.9;
    double finalHeight = height ?? Get.height * 0.062;

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: Container(
        width: finalWidth,
        height: finalHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorConstant.white,
          border: Border.all(color: const Color.fromARGB(255, 201, 199, 199)),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            hintText: hint,
            fillColor: Colors.grey,
            hintStyle: const TextStyle(fontWeight: FontWeight.w800),
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                    color: ColorConstant.black,
                    size: 30,
                  )
                : null, // Display the prefix icon if provided
          ),
        ),
      ),
    );
  }
}
