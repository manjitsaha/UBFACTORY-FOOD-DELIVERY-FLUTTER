import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';

class FlagTextfieldWidget extends StatelessWidget {
  const FlagTextfieldWidget({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
  });
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
        height: height * 0.09,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.grey),
        //   borderRadius: BorderRadius.circular(8),
        // ),
        child: Form(
        child: Column(
          children: [
            TextFormField(cursorColor: ColorConstant.backgound,
              decoration: InputDecoration(
                label: Text(hint,style: TextStyle(fontSize: 18),),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: ColorConstant.blue),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:ColorConstant.blue ,width: 2)
                ),
              prefixIcon: SizedBox(
                width: 50,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Image(image: AssetImage('assets/images/flag.png')),
                    VerticalDivider(thickness: 2),
                  ],
                ),
              ),
              ),
            )
          ],
        ))
      ),
    );
  }
}
//  TextFormField(
//           decoration: InputDecoration(
//             contentPadding: const EdgeInsets.all(10),
//             hintText: hint,
//             hintStyle: const TextStyle(fontWeight: FontWeight.w700),
//             border: InputBorder.none, // Remove the border
//             enabledBorder: InputBorder.none, // Remove the underline
//             focusedBorder: InputBorder.none, // Remove the focused underline
//             
//             suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 30) : null,
//           ),
//         ),