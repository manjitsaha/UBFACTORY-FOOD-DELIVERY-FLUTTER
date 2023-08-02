import 'package:flutter/material.dart';

import '../core/constant/color.dart';

class IconTextWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final IconData icon1;
  final Color iconColor;
  final double iconSize;
  final TextStyle textStyle;
  final MainAxisAlignment mainAxisAlignment;

  const IconTextWidget({super.key, 
    required this.text,
    required this.icon,
    this.iconColor = Colors.black,
    this.iconSize = 24.0,
    this.textStyle = const TextStyle(fontSize: 16, color: Color.fromARGB(255, 43, 42, 42)),
    this.mainAxisAlignment = MainAxisAlignment.start, required this.icon1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          Row(children: [
            Icon(
            icon1,
            color: iconColor,
            size: iconSize,
            ),
            const SizedBox(width: 15,),
          Text(
            text,
           style: TextStyle(fontSize: 17,color: ColorConstant.black),
             
          ),
          ],),
          
          Row(children: [
            Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
          ],)
        ],
      ),
      
    );
  }
}
