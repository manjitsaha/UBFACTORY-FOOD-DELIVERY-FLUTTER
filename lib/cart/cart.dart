import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/widgets/ub_cartrow.dart';
import '../response/status.dart';
import 'controller/cartControlle.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController cc = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    cc.getCart();
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
        body: Obx(
          () {
            switch (cc.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.ERROR:
                return const Text('something went wrong');

              case Status.COMPLETED:
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return UBCartRow(
                        image: cc
                            .cartModel.value.cart!.cartDetails![index].fileUrl
                            .toString(),
                        name: cc.cartModel.value.cart!.cartDetails![index]
                            .productName
                            .toString(),
                        price: cc
                            .cartModel.value.cart!.cartDetails![index].price
                            .toString(),
                        qty: cc
                            .cartModel.value.cart!.cartDetails![index].quantity
                            .toString(),
                        minus: () {
                          if (cc.cartModel.value.cart!.cartDetails![index]
                                  .quantity! >
                              1) {
                            int qty = cc.cartModel.value.cart!
                                    .cartDetails![index].quantity! -
                                1;
                            cc.cartModel.value.cart!.cartDetails![index]
                                .quantity = qty;
                            setState(() {});
                          }
                        },
                        plus: () {
                          int qty = cc.cartModel.value.cart!.cartDetails![index]
                                  .quantity! +
                              1;
                          cc.cartModel.value.cart!.cartDetails![index]
                              .quantity = qty;
                          cc.addToCart(
                              context,
                              cc.cartModel.value.cart!.cartDetails![index]
                                  .productId
                                  .toString(),
                              cc.cartModel.value.cart!.cartDetails![index]
                                  .sizeDetails!.sId
                                  .toString(),
                              1);
                          setState(() {});
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: cc.cartModel.value.cart!.cartDetails!.length);
            }
          },
        ));
  }
}
