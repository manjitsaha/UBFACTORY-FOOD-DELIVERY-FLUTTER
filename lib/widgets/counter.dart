import 'package:flutter/material.dart';
import 'package:newfigma/core/constant/color.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(26),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: _decrement,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(35), // Make it a circle
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                 
                  
                  child: Center(
                    child: Text(
                      '$_quantity',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: _increment,
                  child: Container(
                   width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(35), // Make it a circle
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: ColorConstant.backgound,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
