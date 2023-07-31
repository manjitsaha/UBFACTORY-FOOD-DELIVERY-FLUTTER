import 'package:flutter/material.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key});

  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Beverages',style: TextStyle(fontWeight: FontWeight.w700),),
    ),
    );
  }
}