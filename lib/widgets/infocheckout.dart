import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';

class InfoCheckout extends StatelessWidget {
  final String text1;
  final String? text2; 
  final String? image; 

  const InfoCheckout({
    super.key,
    required this.text1,
    this.text2,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Text(text1, style: TextStyle(fontSize: 16,color: ColorConstant.textGrey,fontWeight: FontWeight.w500)),
          Spacer(),
          
          if (image != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Image.asset(image!),
            ),
          if (text2 != null)
            Text(
              text2!,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          if (image != null || text2 != null) 
            Icon(Icons.arrow_forward_ios, size: 14),
        ],
      ),
    );
  }
}
