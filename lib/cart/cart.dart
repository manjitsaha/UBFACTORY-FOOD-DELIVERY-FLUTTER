import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'controller/cartControlle.dart'; 

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
 CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text('My Cart',style: TextStyle(color: ColorConstant.black),),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text('Cart is empty'));
        } else {
          return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartController.cartItems[index];
              final productId = cartItem['productId'];
              final sizeId = cartItem['sizeId'];
              final quantity = cartItem['quantity'];

              return ListTile(
                title: Text('Product ID: $productId'),
                subtitle: Text('Size ID: $sizeId, Quantity: $quantity'),
                
              );
            },
          );
        }
      }),
    );
  }
}
