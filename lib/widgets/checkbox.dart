import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';

class MyCheckboxWidget extends StatefulWidget {
  final String checkboxText;

  const MyCheckboxWidget({super.key, required this.checkboxText});

  @override
  _MyCheckboxWidgetState createState() => _MyCheckboxWidgetState();
}

class _MyCheckboxWidgetState extends State<MyCheckboxWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height:44,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          child: CheckboxListTile(
            
            activeColor: ColorConstant.backgound,
            checkColor: ColorConstant.white,
            title: Text(widget.checkboxText),
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ),
    );
  }
}