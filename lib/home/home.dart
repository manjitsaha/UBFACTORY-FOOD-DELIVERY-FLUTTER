import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/Product/FoodDetail.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/widgets/boxTextfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double height=Get.height;
    double width=Get.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BoxTextField(hint: 'Search Store',prefixIcon: Icons.search,),
                const SizedBox(height: 10,),
                const Image(image: AssetImage('assets/images/banner.png')),
                const SizedBox(height: 10,),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Exclusive Offer',style: Style.head,),
                  Text('See all',style: TextStyle(color: ColorConstant.backgound,fontWeight: FontWeight.w800),)
                ],),
                const SizedBox(height: 10,),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Image(image: AssetImage('assets/images/home1.png'),height: 200,),
                    SizedBox(width: 10,),
                    Image(image: AssetImage('assets/images/home1.png'),height: 200,),
                    SizedBox(width: 10,),
                    Image(image: AssetImage('assets/images/home1.png'),height: 200,),
                  ],),
                ),
                const SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Best Selling',style: Style.head,),
                  Text('See all',style: TextStyle(color: ColorConstant.backgound,fontWeight: FontWeight.w800),)
                ],),
                const SizedBox(height: 10,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(const Product());
                        },
                        child: Container(
                          height: height*0.28,
                          width: width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              const Center(child: Image(image: AssetImage('assets/images/home2.png'))),
                              const SizedBox(height: 10,),
                              const Text('Bonda'),
                              const Text('6 Pieces'),
                              const SizedBox(height: 15,),
                              Row(children: [
                                const Image(image: AssetImage('assets/images/bag.png')),
                                const Text('50'),
                                const SizedBox(width: 50,),
                                Container(
                                  height: height*0.05,width: width*0.1,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.backgound,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                                
                              ],)
                            ],),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Get.to(const Product());
                        },
                        child: Container(
                          height: height*0.28,
                          width: width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              const Center(child: Image(image: AssetImage('assets/images/home3.png'))),
                              const SizedBox(height: 15,),
                              const Text('Bonda'),
                              const Text('6 Pieces'),
                              const SizedBox(height: 15,),
                              Row(children: [
                                const Image(image: AssetImage('assets/images/bag.png')),
                                const Text('50'),
                                const SizedBox(width: 50,),
                                Container(
                                  height: height*0.05,width: width*0.1,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.backgound,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                                
                              ],)
                            ],),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        height: height*0.28,
                        width: width*0.4,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const Center(child: Image(image: AssetImage('assets/images/home2.png'))),
                            const SizedBox(height: 10,),
                            const Text('Bonda'),
                            const Text('6 Pieces'),
                            const SizedBox(height: 15,),
                            Row(children: [
                              const Image(image: AssetImage('assets/images/bag.png')),
                              const Text('50'),
                              const SizedBox(width: 50,),
                              Container(
                                height: height*0.05,width: width*0.1,
                                decoration: BoxDecoration(
                                  color: ColorConstant.backgound,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: const Icon(Icons.add),
                              ),
                              
                            ],)
                          ],),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Groceries',style: Style.head,),
                  Text('See all',style: TextStyle(color: ColorConstant.backgound,fontWeight: FontWeight.w800),)
                ],),
                const SizedBox(height: 6,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(height: height*0.1,width: width*0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorConstant.lightOrange
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(children: [
                          Image(image: AssetImage('assets/images/pulse.png')),
                          SizedBox(width: 10,),
                          Text('Pulses')
                        ]),
                      ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        height: height*0.1,width: width*0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorConstant.lightGreen
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                        child: Row(children: [
                          Image(image: AssetImage('assets/images/rice.png')),
                          SizedBox(width: 10,),
                          Text('Rice')
                        ]),
                      ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: height*0.28,
                        width: width*0.4,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const Center(child: Image(image: AssetImage('assets/images/home2.png'))),
                            const SizedBox(height: 10,),
                            const Text('Bonda'),
                            const Text('6 Pieces'),
                            const SizedBox(height: 15,),
                            Row(children: [
                              const Image(image: AssetImage('assets/images/bag.png')),
                              const Text('50'),
                              const SizedBox(width: 50,),
                              Container(
                                height: height*0.05,width: width*0.1,
                                decoration: BoxDecoration(
                                  color: ColorConstant.backgound,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: const Icon(Icons.add),
                              ),
                              
                            ],)
                          ],),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        height: height*0.28,
                        width: width*0.4,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const Center(child: Image(image: AssetImage('assets/images/home2.png'))),
                            const SizedBox(height: 15,),
                            const Text('Bonda'),
                            const Text('6 Pieces'),
                            const SizedBox(height: 15,),
                            Row(children: [
                              const Image(image: AssetImage('assets/images/bag.png')),
                              const Text('50'),
                              const SizedBox(width: 50,),
                              Container(
                                height: height*0.05,width: width*0.1,
                                decoration: BoxDecoration(
                                  color: ColorConstant.backgound,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: const Icon(Icons.add),
                              ),
                              
                            ],)
                          ],),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        height: height*0.28,
                        width: width*0.4,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const Center(child: Image(image: AssetImage('assets/images/home2.png'))),
                            const SizedBox(height: 10,),
                            const Text('Bonda'),
                            const Text('6 Pieces'),
                            const SizedBox(height: 15,),
                            Row(children: [
                              const Image(image: AssetImage('assets/images/bag.png')),
                              const Text('50'),
                              const SizedBox(width: 50,),
                              Container(
                                height: height*0.05,width: width*0.1,
                                decoration: BoxDecoration(
                                  color: ColorConstant.backgound,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: const Icon(Icons.add),
                              ),
                              
                            ],)
                          ],),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}