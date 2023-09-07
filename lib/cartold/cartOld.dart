import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/Product/FoodDetail.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/profile/delivery_address/delivery_address.dart';
import 'package:newfigma/profile/profile.dart';
import 'package:newfigma/widgets/counter.dart';
import 'package:newfigma/widgets/detailInfo.dart';
import '../cart/controller/cartControlle.dart';
import '../cart/placeOrder.dart';
import '../checkout/checkout.dart';
import '../widgets/button.dart';
import '../widgets/iconbutton.dart';
import '../widgets/infocheckout.dart';

class CartOld extends StatefulWidget {
  const CartOld({super.key});

  @override
  State<CartOld> createState() => _CartOldState();
}

class _CartOldState extends State<CartOld> {
  final CartController cc = Get.put(CartController());
  void show() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26), topRight: Radius.circular(26))),
      context: context,
      builder: (BuildContext context) {
        final height = MediaQuery.of(context).size.height;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(26),
                      topLeft: Radius.circular(26))),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Text('Checkout',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.close))
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    InfoCheckout(text1: 'Delivery', text2: 'Select Method'),
                    Divider(
                      thickness: 1,
                    ),
                    InfoCheckout(
                        text1: 'Payment', image: 'assets/images/card.png'),
                    Divider(
                      thickness: 1,
                    ),
                    InfoCheckout(
                      text1: 'Promo Code',
                      text2: 'Pick Discount',
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    InfoCheckout(
                      text1: 'Total Cost',
                      image: 'assets/images/Rupee.png',
                      text2: '${cc.cartModel.value.totalPrice}',
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text('By Placing an Order you agree to our'),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          TextSpan(text: '  '),
                          TextSpan(
                            text: 'and',
                          ),
                          TextSpan(text: ' '),
                          TextSpan(
                              text: 'Conditions',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                        onPressed: () {
                          Get.to(OrderPlace());
                        },
                        height: height * 0.06,
                        text: 'Place Order',
                        backgroundColor: ColorConstant.backgound,
                        textColor: ColorConstant.white)
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
    
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      backgroundColor: ColorConstant.white,
      // appBar: AppBar(
      //   title: Padding(
      //     padding: const EdgeInsets.only(left: 0),
      //     child: Text(
      //       'My Cart',
      //       style: TextStyle(color: Colors.black, fontSize: 24),
      //     ),
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 12, 12, 12),
              child: Text(
              'My Cart',
              style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
            ),
            Material(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  // Column(
                  //   children: [
                  //     Text('',style: TextStyle(fontSize: 16),),
                  //   ],
                  // ),
                  DetailInfo(text1: 'Deliver to: ',fontWeight1: FontWeight.w400,text3: 'Akansha Singla,132102',textSize1: 14, textSize2: 14,text2: 'Sec 12, Near Grand Hotel....'),
                  IconButtonWidget(onPressed: (){
                  Get.to(ProfileDeliveryAddress());
                  }, text: 'Change', backgroundColor: Colors.white, textColor: ColorConstant.blue,width: width*0.2,border:Border.all(color: ColorConstant.blue),
                  height: height*0.05,
                  )
                  ],
                ),
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(FoodDetail(
                                id: '',
                                name: 'Bell Pepper',
                                sizeName: '1Kg',
                                price: '50',
                                fileUrl: 'fileUrl',
                                description:
                                    'Fresh Vegetables now at your door.\nEnjoy our Services.'));
                          },
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Image(
                                        image: AssetImage('assets/images/c1.png')),
                                  ),
                                  SizedBox(height: 10,),
                                  const Counter()
                                ],
                              ),
                              SizedBox(width: 25,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bell Pepper Red', style: Style.smallHead1),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('1kg,Price',style: TextStyle(fontFamily: 'regular'),),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Image(image: AssetImage('assets/images/stars.png')),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: Row(
                                      children: [
                                        // Container(
                                        //   height: height * 0.035,
                                        //   decoration: BoxDecoration(
                                        //       color: ColorConstant.backgound,
                                        //       borderRadius: BorderRadius.only(
                                        //           bottomRight: Radius.circular(12),
                                        //           topLeft: Radius.circular(12))),
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.all(4.0),
                                        //     child: Text('20% Off'),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                         Text(
                                          '₹ 80',
                                          style: TextStyle(
                                              decoration: TextDecoration.lineThrough),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('50',style:TextStyle(fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.close_outlined)),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(FoodDetail(
                                id: '',
                                name: 'Idli',
                                sizeName: '1Kg',
                                price: '50',
                                fileUrl: 'fileUrl',
                                description:
                                    'Fresh Idli now at your door.\nEnjoy our Services.'));
                          },
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(image: AssetImage('assets/images/c2.png')),
                                  SizedBox(height: 10,),
                                  const Counter()
                                ],
                              ),
                              const SizedBox(
                                width: 35,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text('Idli', style: Style.smallHead1),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('1kg,Price'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Image(image: AssetImage('assets/images/stars.png')),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: Row(
                                      children: [
                                        // Container(
                                        //   height: height * 0.035,
                                        //   decoration: BoxDecoration(
                                        //       color: ColorConstant.backgound,
                                        //       borderRadius: BorderRadius.only(
                                        //           bottomRight: Radius.circular(12),
                                        //           topLeft: Radius.circular(12))),
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.all(4.0),
                                        //     child: Text('30% Off'),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '₹ 80',
                                          style: TextStyle(
                                              decoration: TextDecoration.lineThrough),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('50',style:TextStyle(fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.close_outlined)),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(FoodDetail(
                                id: '',
                                name: 'Bonda',
                                sizeName: '6 Peices',
                                price: '80',
                                fileUrl: 'fileUrl',
                                description:
                                    'Fresh Cooked Food now at your door.\nEnjoy our Services.'));
                          },
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(image: AssetImage('assets/images/home2.png')),
                                  SizedBox(height: 10,),
                                  const Counter()
                                ],
                              ),
                              SizedBox(width: 25,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Bonda', style: Style.smallHead1),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('6 Peices'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset('assets/images/stars.png'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: Row(
                                      children: [
                                        // Container(
                                        //   height: height * 0.035,
                                        //   decoration: BoxDecoration(
                                        //       color: ColorConstant.backgound,
                                        //       borderRadius: BorderRadius.only(
                                        //           bottomRight: Radius.circular(12),
                                        //           topLeft: Radius.circular(12))),
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.all(4.0),
                                        //     child: Text('15% Off'),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                         Text(
                                          '₹ 80',
                                          style: TextStyle(
                                              decoration: TextDecoration.lineThrough),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('50',style:TextStyle(fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.close_outlined)),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(FoodDetail(
                                id: '',
                                name: 'Dosa',
                                sizeName: '1 Plate',
                                price: '120',
                                fileUrl: 'fileUrl',
                                description:
                                    'Fresh Cooked Food now at your door.\nEnjoy our Services.'));
                          },
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image(image: AssetImage('assets/images/home3.png')),
                                  SizedBox(height: 10,),
                                  const Counter()
                                ],
                              ),
                              SizedBox(width: 25,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Dosa', style: Style.smallHead1),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('250gm,Price'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset('assets/images/stars.png'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: Row(
                                      children: [
                                        // Container(
                                        //   height: height * 0.035,
                                        //   decoration: BoxDecoration(
                                        //       color: ColorConstant.backgound,
                                        //       borderRadius: BorderRadius.only(
                                        //           bottomRight: Radius.circular(12),
                                        //           topLeft: Radius.circular(12))),
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.all(4.0),
                                        //     child: Text('15% Off'),
                                        //   ),
                                        // ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '₹ 80',
                                          style: TextStyle(
                                              decoration: TextDecoration.lineThrough),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('50',style:TextStyle(fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.close_outlined)),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                    
                      ],
                  ),
                ),
              ),
            ),
           Container(
                height: height * 0.11,
               decoration: BoxDecoration(
                 color: Color.fromARGB(255, 238, 238, 238),
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(18),topRight: Radius.circular(18))
               ),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                  child: Stack(children: [
                    Positioned(
                        left: width*0.25,
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            // color: ColorConstant.backgound,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              children: [
                                Icon(Icons.celebration,size: 16,color: ColorConstant.backgound,),SizedBox(width:5),
                                Text('Yay !! You Saved ₹100',style: TextStyle(color:ColorConstant.backgound),),
                              ],
                            ),
                          ),
                        )),
                        SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '₹200',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text('View Price Details')
                              ],
                            ),
                          ),
                          ButtonWidget(
                            height: height*0.06,
                            width: width * 0.4,
                            text: 'Checkout',
                            backgroundColor: ColorConstant.backgound,
                            textColor: ColorConstant.white, onPressed: (){
                              Get.to(Checkout());
                            },
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
           
          ],
        ),
      ),
    );
  }
}
