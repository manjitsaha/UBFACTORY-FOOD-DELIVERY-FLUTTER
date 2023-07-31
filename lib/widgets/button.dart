import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function onPressed;
  final double? width;
  final double? height;
  final BorderSide? border; // Add the border variable

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.width,
    this.height,
    this.border, // Provide a default value if needed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 55,
      width: width ?? 400,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          elevation:const MaterialStatePropertyAll(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: border ?? BorderSide.none, // Use the provided border or none
            ),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
