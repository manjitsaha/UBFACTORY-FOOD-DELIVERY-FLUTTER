import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';

class IconButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color? textColor;
  final Function onPressed;
  final IconData? icon;
  final ImageProvider? image;
  final IconData? prefixIcon; // New property for prefix icon
  final ImageProvider? prefixImage; // New property for prefix image
  final double? width;
  final double? height;

  const IconButtonWidget({super.key, 
    Key? key, // Correct the parameter name
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    this.textColor,
    this.icon,
    this.image,
    this.prefixIcon,
    this.prefixImage, // New property for prefix image
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55,
      width: width ?? 400,
      child: TextButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (prefixIcon != null) // Render the prefix icon if provided
              Icon(prefixIcon, color: ColorConstant.white),
            if (prefixImage != null) // Render the prefix image if provided
              Container(
                width: 24, // Customize the width of the image
                height: 24, // Customize the height of the image
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: prefixImage!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            Text(
              text,
              style: TextStyle(fontSize: 17, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
