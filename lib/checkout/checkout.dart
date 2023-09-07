import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/cart/controller/cartControlle.dart';
import 'package:newfigma/cart/placeOrder.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/profile/delivery_address/delivery_address.dart';
import 'package:newfigma/profile/promoCode/promoCode.dart';
import 'package:newfigma/widgets/boxTextfield.dart';
import 'package:newfigma/widgets/counter.dart';
import 'package:newfigma/widgets/infocheckout.dart';

import '../Product/FoodDetail.dart';
import '../home/controller/homeController.dart';
import '../search/search.dart';
import '../widgets/button.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  CartController cartController = CartController();
  HomeController hc = HomeController();
  List<Map<String, dynamic>> product = [];
  Future<void> fetchProductData() async {
    List<Map<String, dynamic>> productData = await hc.getproduct();
    setState(() {
      product = productData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hc.getproduct();
    fetchProductData();
  }

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text(
          'My Cart',
          style: TextStyle(color: ColorConstant.black),
        ),
      ),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Expanded(child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Delivery to : ',
                            style: Style.normal,
                          ),
                        Text('Panipat 132103',style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                      ButtonWidget(
                        onPressed: () {
                          Get.to(ProfileDeliveryAddress());
                        },
                        text: 'Change',
                        backgroundColor: ColorConstant.white,
                        textColor: ColorConstant.backgound,
                        width: width * 0.25,
                        border: BorderSide(color: ColorConstant.backgound),
                        height: height * 0.04,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Items:',
                            style: Style.normal1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Coconut Chutney',
                            style: Style.normal,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 8, 0),
                        child: Column(
                          children: [
                            Text(
                              'Quantity:',
                              style: Style.normal1,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Counter()
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                 
                  
                  SizedBox(
                    height: 20,
                  ),
                 
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Apply Promo Code',
                        style: Style.normal1,
                      ),
                      ButtonWidget(
                          onPressed: () {
                            Get.to(PromoCode());
                          },
                          text: 'Choose',
                          backgroundColor: ColorConstant.white,border: BorderSide(color: ColorConstant.backgound),
                          width: width * 0.3,
                          height: height * 0.04,
                          textColor: ColorConstant.backgound),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: width * 1,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F5F6),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      children: [
                        InfoCheckout(
                          text1: 'Price',
                          text2: '389',
                        ),
                        InfoCheckout(
                          text1: 'Discount',
                          text2: '125',
                        ),
                        InfoCheckout(
                          text1: 'Tax',
                          text2: '25.08',
                        ),
                        InfoCheckout(
                          text1: 'Gst',
                          text2: '10.21',
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  InfoCheckout(
                    text1: 'Total',
                    text2: '300',
                  ),
                  SizedBox(height: 20,),
                  ButtonWidget(
                    onPressed: () {
                      Get.to(OrderPlace());
                    },
                    text: 'Proceed to pay',
                    backgroundColor: ColorConstant.backgound,
                    textColor: ColorConstant.white,
                    width: width * 0.9,
                    height: height * 0.06,
                  ),
                         SizedBox(height: 20,),
                 Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 7.5,
                  ),
                  Text(
                    'Add more',
                    style: Style.normal,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SingleChildScrollView(
                            child: Row(
                          children: List.generate(product.length, (index) {
                            double? originalPrice =
                                double.tryParse(product[index]['promoPrice'] ?? '');
                            double? promoPrice =
                                double.tryParse(product[index]['price'] ?? '');
                            
                            double discountPercentage = 0;
                            if (originalPrice != null &&
                                promoPrice != null &&
                                originalPrice > promoPrice) {
                              double discountAmount = originalPrice - promoPrice;
                              discountPercentage =
                                  (discountAmount / originalPrice) * 100;
                            }
                            
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(FoodDetail(
                                    id: product[index]['id'] ?? '',
                                    name: product[index]['name'] ?? '',
                                    sizeName: product[index]['sizeName'] ?? '',
                                    price: product[index]['price'] ?? '',
                                    fileUrl: product[index]['fileUrl'] ?? '',
                                    description: product[index]['description'],
                                  ));
                                },
                                child: Container(
                                  height: height * 0.3,
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 201, 201, 201)),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 4),
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(12))),
                                        child: Text(
                                          '${discountPercentage.toStringAsFixed(0)}% Off',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 12),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Center(
                                                child: Image(
                                                    image: AssetImage(
                                                        'assets/images/home2.png'))),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              product[index]['name'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(product[index]['sizeName']),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                const Image(
                                                    image: AssetImage(
                                                        'assets/images/Rupee.png')),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '${originalPrice}',
                                                      style: TextStyle(
                                                          decoration: TextDecoration
                                                              .lineThrough),
                                                    ),
                                                    Text(
                                                      '${promoPrice}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 45,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addToCart(
                                                        context,
                                                        product[index]['id'],
                                                        product[index]['sizeId'],
                                                        1);
                                                  },
                                                  child: Container(
                                                    height: height * 0.05,
                                                    width: width * 0.1,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            ColorConstant.backgound,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8)),
                                                    child: const Icon(Icons.add),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        )),
                        
                        IconButton(
                            onPressed: () {
                              Get.to(Search());
                            },
                            icon: Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ],
                 ),
               ),
             )
             ),
            
            ],
          )),
    );
  }
}
