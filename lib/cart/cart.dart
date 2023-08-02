import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/cart/placeOrder.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/widgets/counter.dart';

import '../widgets/button.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text('My Cart',style: Style.heading,)),
                const SizedBox(height: 10,),
                const Divider(thickness: 2,),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      const Image(image: AssetImage('assets/images/c1.png')),
                      const SizedBox(width: 20,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Bell Pepper Red',style: Style.smallHead),
                        const Text('1kg,Price'),
                        const SizedBox(height: 5,),
                        const Counter()
                      ],),
                      Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.close_outlined)),
                          const SizedBox(height: 10,),
                          const Row(children: [
                            Image(image: AssetImage('assets/images/bag.png')),
                        Text('50'),
                          ],)
                        ],
                      ),
                      
                    ],
                  ),
                ),
                const Divider(thickness: 2,),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 5, 15),
                  child: Row(
                    children: [
                      const Image(image: AssetImage('assets/images/c2.png')),
                      const SizedBox(width: 20,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Idli',style: Style.smallHead),
                        const Text('1kg,Price'),
                        const SizedBox(height: 5,),
                        const Counter()
                      ],),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.close_outlined)),
                          const SizedBox(height: 10,),
                          const Row(children: [
                            Image(image: AssetImage('assets/images/bag.png')),
                        Text('50'),
                          ],)
                        ],
                      ),
                      
                    ],
                  ),
                ),
                const Divider(thickness: 2,),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                  child: Row(
                    children: [
                      const Image(image: AssetImage('assets/images/home2.png')),
                      const SizedBox(width: 20,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Bonda',style: Style.smallHead),
                        const Text('6 Peices'),
                        const SizedBox(height: 5,),
                        const Counter()
                      ],),
                      Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.close_outlined)),
                          const SizedBox(height: 10,),
                          const Row(children: [
                            Image(image: AssetImage('assets/images/bag.png')),
                        Text('50'),
                          ],)
                        ],
                      ),
                      
                    ],
                  ),
                ),
                const Divider(thickness: 2,),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                  child: Row(
                    children: [
                      const Image(image: AssetImage('assets/images/home3.png')),
                      const SizedBox(width: 20,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Dosa',style: Style.smallHead),
                        const Text('250gm,Price'),
                        const SizedBox(height: 5,),
                        const Counter()
                      ],),
                      Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.close_outlined)),
                          const SizedBox(height: 10,),
                          const Row(children: [
                            Image(image: AssetImage('assets/images/bag.png')),
                        Text('50'),
                          ],)
                        ],
                      ),
                      
                    ],
                  ),
                ),
                const Divider(thickness: 2,),
                ButtonWidget(onPressed: (){
                  showModalBottomSheet(context:context ,
                   builder: (context){
                    return Wrap(clipBehavior: Clip.none,
                    children: [
                      Container(height: 700,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text('Checkout',style: Style.heading,),
                                  IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.close_outlined))
                                ],),
                              ),
                              const Divider(thickness: 1,),
                               Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                  const Text('Delivery'),
                                  const SizedBox(width: 165,),
                                  Text('Select Method',style: Style.smallHead,),
                                  const Icon(Icons.arrow_forward_ios)
                                ],),
                              ),
                              const Divider(thickness: 1,),
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                  Text('Payment'),
                                  SizedBox(width: 240,),
                                  Image(image: AssetImage('assets/images/card.png')),
                                  Icon(Icons.arrow_forward_ios)
                                ],),
                              ),
                              const Divider(thickness: 1,),
                               Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                  const Text('Promo Code'),
                                  const SizedBox(width: 140,),
                                  Text('Pick Discount',style: Style.smallHead,),
                                  const Icon(Icons.arrow_forward_ios)
                                ],),
                              ),
                              const Divider(thickness: 1,),
                               Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                  const Text('Total Cost'),
                                  const SizedBox(width: 215,),
                                  const Image(image: AssetImage('assets/images/bag.png')),
                                  Text('50',style: Style.smallHead,),
                                  const Icon(Icons.arrow_forward_ios)
                                ],),
                              ),
                              const Divider(thickness: 1,),
                              const Text('By Placing an order you agree to  our\nTerms and Conditions',style: TextStyle(fontSize: 12),),
                              const SizedBox(height: 15,),
                              ButtonWidget(onPressed: (){
                                Get.to(const OrderPlace());
                              },
                               text: "Place Order", backgroundColor: ColorConstant.backgound, textColor: ColorConstant.white),
                               const SizedBox(height: 15,)
                            ],
                          ),
                        ),
                      )
                    ],
                    );
                   });
                },
                 text: 'Go to Checkout',
                  backgroundColor: ColorConstant.backgound, textColor: ColorConstant.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}