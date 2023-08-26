import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'controller/cartControlle.dart';
import 'model/cart_model.dart'; // Import your CartModel

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController cartController = Get.put(CartController());
  

  @override
  void initState() {
    super.initState();
    cartController.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            'Cart Screen',
            style: TextStyle(color: ColorConstant.black),
          ),
        ),
        backgroundColor: ColorConstant.white,
        elevation: 0,
      ),
      body: FutureBuilder<CartModel>(
        future: cartController.getCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            CartModel cartModel = snapshot.data!;
            return ListView.builder(
              itemCount: cartModel.cart!.cartDetails!.length,
              itemBuilder: (context, index) {
                CartDetails cartItem = cartModel.cart!.cartDetails![index];
               int itemQuantity = cartItem.quantity ?? 1;

                void incrementItemQuantity() {
                  setState(() {
                    itemQuantity++;
                  });
                }

                void decrementItemQuantity() {
                  if (itemQuantity > 1) {
                    setState(() {
                      itemQuantity--;
                    });
                  }
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(
                          cartItem.fileUrl!,
                          errorBuilder: (context, error, stackTrace) {
                            return Image(
                                image: AssetImage('assets/images/home2.png'));
                          },
                        ),
                        title: Text(cartItem.productName!),
                        subtitle: Text('Price: ${cartItem.price!}'),
                        trailing: Text('Quantity: ${cartItem.quantity}'),
                      ),
                      // Container(
                      //   width: 180,
                      //   child: Row(
                      //     children: [
                      //       GestureDetector(
                      //         onTap: decrementItemQuantity,
                      //         child: Container(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: const Icon(Icons.remove),
                      //         ),
                      //       ),
                      //       const SizedBox(width: 15),
                      //       Container(
                      //         width: 35,
                      //         height: 35,
                      //         decoration: BoxDecoration(
                      //           border: Border.all(color: Colors.grey),
                      //           borderRadius: BorderRadius.circular(8.0),
                      //         ),
                      //         child: Center(
                      //           child: Text('$itemQuantity',
                      //               style: const TextStyle(fontSize: 16)),
                      //         ),
                      //       ),
                      //       const SizedBox(width: 15),
                      //       GestureDetector(
                      //         onTap: incrementItemQuantity,
                      //         child: Container(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: const Icon(Icons.add),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Divider(thickness: 2),
                    ],
                  ),
                );
              },
            );
          } else {
            return Text('No cart items available.');
          }
        },
      ),
    );
  }
}
