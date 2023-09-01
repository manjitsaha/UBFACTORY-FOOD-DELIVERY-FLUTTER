import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/cart/placeOrder.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:newfigma/widgets/infocheckout.dart';
import 'package:newfigma/widgets/ub_cartrow.dart';
import '../response/status.dart';
import 'controller/cartControlle.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController cc = Get.put(CartController());
  double height =Get.height;
  @override
  void initState() {
    super.initState();
    cc.getCart();
  }
  void show(){
     showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(26),topRight: Radius.circular(26))),
      context: context,
      builder: (BuildContext context) {
         final height = MediaQuery.of(context).size.height;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
             
              decoration: BoxDecoration(
                
              borderRadius: BorderRadius.only(topRight: Radius.circular(26),topLeft: Radius.circular(26))
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: Row(
                      children: [
                      Text('Checkout',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
                      Spacer(),
                      IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.close))
                      ],
                     ),
                   ),
                  Divider(thickness: 1,),
                   InfoCheckout(text1: 'Delivery', text2: 'Select Method'),
                   Divider(thickness: 1,),
                   InfoCheckout(text1: 'Payment', image: 'assets/images/card.png'),
                   Divider(thickness: 1,),
                   InfoCheckout(text1: 'Promo Code',text2: 'Pick Discount',),
                   Divider(thickness: 1,),
                   InfoCheckout(text1: 'Total Cost',image: 'assets/images/bag.png',text2: '${cc.cartModel.value.totalPrice}',),
                   Divider(thickness: 1,),SizedBox(height: 0,),
                   Text('By Placing an Order you agree to our'),
                    RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(text: 'Terms',style: TextStyle(fontWeight: FontWeight.w500)),
                        TextSpan(text: '  '),
                        TextSpan(
                          text: 'and',
                        ),
                        TextSpan(text: ' '),
                        TextSpan(text: 'Conditions',style: TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                   SizedBox(height: 10,),
                   ButtonWidget(onPressed: (){
                    Get.to(OrderPlace());
                   },height: height*0.06,
                   text: 'Place Order', backgroundColor: ColorConstant.backgound, textColor: ColorConstant.white)
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  
  }
  @override
  Widget build(BuildContext context) {
    double width=Get.width;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            'My Cart',
            style: TextStyle(color: ColorConstant.black),
          ),
        ),
        backgroundColor: ColorConstant.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                switch (cc.rxRequestStatus.value) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.ERROR:
                    return Text('Something went wrong');

                  case Status.COMPLETED:
                    if (cc.cartModel.value.cart?.cartDetails != null &&
                        cc.cartModel.value.cart!.cartDetails!.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final cartItem =
                                cc.cartModel.value.cart!.cartDetails![index];
                            return UBCartRow(
                              image: cartItem.fileUrl.toString(),
                              name: cartItem.productName.toString(),
                              price: cartItem.price.toString(),
                              qty: cartItem.quantity.toString(),
                              itemId: cartItem.itemId.toString(),
                              minus: () {
                                if (cartItem.quantity! > 0) {
                                  int qty = cartItem.quantity! - 1;
                                  cartItem.quantity = qty;
                                  cc.removeFromCart(
                                    cartItem.itemId.toString(),
                                  );
                                  setState(() {});
                                }
                              },
                              plus: () {
                                int qty = cartItem.quantity! + 1;
                                cartItem.quantity = qty;
                                if (cartItem.sizeDetails != null) {
                                  cc.addToCart(
                                    context,
                                    cartItem.productId.toString(),
                                    cartItem.sizeDetails!.sId.toString(),
                                    1,
                                  );
                                }
                                setState(() {});
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(thickness: 2);
                          },
                          itemCount:
                              cc.cartModel.value.cart!.cartDetails!.length,
                        ),
                      );
                    } else {
                      return Center(child: Text('No items in the cart'));
                    }
                  default:
                    return Text('Unhandled status');
                }
              },
            ),
          ),
         
          Visibility(
            visible:cc.cartModel.value.cart?.cartCount != null &&
              cc.cartModel.value.cart!.cartCount != 0,
            child: Container(
              height: 80,
              color: Color.fromARGB(255, 240, 239, 239),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              '₹${cc.cartModel.value.totalPrice}',
                               style: TextStyle(fontSize: 19),
                              ),
                            SizedBox(height: 8,),
                          Text('View Price Details')
                        ],
                      ),
                    ),
                    ButtonWidget(
                      onPressed: () {
                        show();
                      },
                      width: width*0.5,
                      text: 'Checkout',
                      backgroundColor: ColorConstant.backgound,
                      textColor: ColorConstant.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
