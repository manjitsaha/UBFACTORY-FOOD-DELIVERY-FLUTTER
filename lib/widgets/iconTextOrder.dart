import 'package:flutter/material.dart';

class OrderStatus extends StatefulWidget {
  final Color? iconColor;
  final String statusText;

  const OrderStatus({
    Key? key,
     this.iconColor,
    required this.statusText,
  }) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.check_circle_rounded,
          color: widget.iconColor,
        ),
        SizedBox(width: 8), 
        Text(
          widget.statusText,
          style: TextStyle(fontSize: 16), 
        ),
      ],
    );
  }
}
