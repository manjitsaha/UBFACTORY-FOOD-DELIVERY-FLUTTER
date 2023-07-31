import 'package:flutter/material.dart';
import '../core/constant/color.dart';
class DropdownTextFieldWidget extends StatefulWidget {
  final List<String> options;
  final String hintText;
  final Function(String) onChanged;

  const DropdownTextFieldWidget({super.key, 
    required this.options,
    required this.hintText,
    required this.onChanged,
  });

  @override
  _DropdownTextFieldWidgetState createState() => _DropdownTextFieldWidgetState();
}

class _DropdownTextFieldWidgetState extends State<DropdownTextFieldWidget> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedOption,
      onChanged: (value) {
        setState(() {
          selectedOption = value;
        });
        widget.onChanged(value!);
      },
      items: widget.options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: false,
        fillColor: ColorConstant.white,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
           ),
            focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
              ),
        contentPadding: const EdgeInsets.all(10),
      ),
      
    );
  }
}
