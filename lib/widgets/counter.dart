import 'package:flutter/material.dart';

class Counter extends StatefulWidget {

  const Counter({super.key, });

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
    return Row(children: [
            Container(width: 180,
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.grey)
                  ),
                   child: Row(
                   children: [
                    GestureDetector(
                      onTap: _decrement,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(Icons.remove),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                    child:Center(child: Text('$_quantity',style: const TextStyle(fontSize: 16),)),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: _increment,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(Icons.add),
                      ),
                    ),
                      ],
                   ),
                 ),
    ]);
  }
}