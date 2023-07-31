import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FlagTextfieldWidget extends StatelessWidget {
  const FlagTextfieldWidget({super.key, required this.hint, this.prefixIcon, this.suffixIcon});
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: Container(
        width: width * 0.9,
        height: height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
             
        ),
        child: TextFormField(
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
            prefixIcon: Container(child:  const Image(image: AssetImage('assets/images/flag.png')),),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon,size: 30,) : null, // Display the prefix icon if provided
          ),
        ),
      ),
    );
  }
}
