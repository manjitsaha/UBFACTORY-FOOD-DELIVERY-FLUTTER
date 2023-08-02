import 'package:flutter/material.dart';
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
                ButtonWidget(onPressed: (){},
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