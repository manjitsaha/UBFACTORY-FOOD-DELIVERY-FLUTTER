import 'package:flutter/material.dart';

import '../core/constant/color.dart';

class IconButtonWidget extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Function onPressed;
  final IconData? icon;
  final ImageProvider? image;
  final IconData? prefixIcon;
  final ImageProvider? prefixImage;
  final Color? prefixIconColor;
  final Color? borderColor; // New property for border color
  final Border? border; // New property for border
  final double? width;
  final double? height;

  const IconButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.image,
    this.prefixIcon,
    this.prefixImage,
    this.prefixIconColor,
    this.borderColor, // New property for border color
    this.border, // New property for border
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55,
      width: width ?? 400,
      child: TextButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              // Apply the provided border or default to no border
              side: border?.top ?? BorderSide.none,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          // Apply the provided border color or default to transparent
          overlayColor: MaterialStateProperty.all(borderColor ?? Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (prefixIcon != null)
              Icon(
                prefixIcon,
                color: prefixIconColor ?? ColorConstant.white,
              ),
            if (prefixImage != null)
              Container(
                width: 24,
                height: 24,
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
