import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  final Color iconColor;
  final String statusText;

  const OrderStatus({
    required this.iconColor,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            Icons.check_circle_rounded,
            color: iconColor,
          ),
        ),
        SizedBox(width: 12),
        Text(
          statusText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
