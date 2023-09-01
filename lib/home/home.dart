import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:newfigma/Product/FoodDetail.dart';
import 'package:newfigma/cart/controller/cartControlle.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/explore/explore.dart';
import 'package:newfigma/home/controller/homeController.dart';
import 'package:newfigma/home/controller/productController.dart';
import 'package:newfigma/search/search.dart';
import 'package:newfigma/widgets/boxTextfield.dart';
import '../ColorModel/Color_Model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
HomeController hc= HomeController();
  
  List<Map<String, dynamic>> discountData = [];
  Future<void> fetchDiscountData() async {
    List<Map<String, dynamic>> extractedData = await hc.discount();
    setState(() {
      discountData = extractedData;
    });
  }
  String Address='';
Position? _currentPosition;

Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      GetAddressFromLatLong(_currentPosition!);
      String lat = position.latitude.toString() ;
      String long = position.longitude.toString();
      print(lat + " "+ long);
    }).catchError((e) {
      debugPrint(e);
    });
  }
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      //return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> GetAddressFromLatLong(Position position) async {
List<Placemark> placemark= await placemarkFromCoordinates(position.latitude, position.longitude);
  print(placemark);
  Placemark place = placemark[0];

  Address = '${place.country}';

  setState(() {
    
  });
  }
  List<ColorModel> colors = [
    ColorModel(
        backgorundColor: ColorConstant.extralightGreen,
        borderColor: ColorConstant.lightGreen),
    ColorModel(
        backgorundColor: ColorConstant.extralightOrange,
        borderColor: ColorConstant.lightOrange),
    ColorModel(
        backgorundColor: ColorConstant.lightpurple,
        borderColor: ColorConstant.purple),
    ColorModel(backgorundColor: Colors.redAccent, borderColor: Colors.red)
  ];

  int Function() generateRandom = () {
    Random random = new Random();
    int min = 1, max = 4;
    int num = min + random.nextInt(max - min);
    return num;
  };
  List<Map<String, dynamic>> bestSellingData = [];
  Future<void> fetchBestSelling() async {
    List<Map<String, dynamic>> bestData = await hc.bestselling();
    setState(() {
      bestSellingData = bestData;
    });
  }

  List<Map<String, dynamic>> categoryData1 = [];
  Future<void> fetchCategoryData() async {
    List<Map<String, dynamic>> categoryData = await hc.getcategory();
    setState(() {
      categoryData1 = categoryData;
    });
  }

  List<Map<String, dynamic>> product = [];
  Future<void> fetchProductData() async {
    List<Map<String, dynamic>> productData = await hc.getproduct();
    setState(() {
      product = productData;
    });
  }
bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hc.discount();
    fetchDiscountData();
    hc.bestselling();
    fetchBestSelling();
    hc.getcategory();
    fetchCategoryData();
    hc.getproduct();
    fetchProductData();
    _getCurrentPosition();
  }

  CartController cartController = CartController();
  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_pin),
                    Text(Address,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text('Same day Delivery.', style: Style.greenhead),
              ),
              Text(
                'Order by 11:00am and we will deliver by 6:00pm',
                style: Style.greensmall,
              ),
              const BoxTextField(
                showBorder: false,
                borderRadius: 11,
                hint: 'Search Store',
                prefixIcon: Icons.search,
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(discountData.length, (index) {
                    return GestureDetector(
                        onTap: () {
                          String id = discountData[index]['_id'];
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.network(
                              discountData[index]['imageUrl'],
                              height: 50,
                              width: 100,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.asset('assets/images/banner.png');
                              },
                            ),
                          ),
                        ));

                  })
                  )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exclusive Offer',
                    style: Style.head,
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: ColorConstant.backgound,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/home1.png'),
                      height: 200,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage('assets/images/home1.png'),
                      height: 200,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage('assets/images/home1.png'),
                      height: 200,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Selling',
                    style: Style.head,
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: ColorConstant.backgound,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            List.generate(bestSellingData.length, (index) {
                          final product = bestSellingData[index];

                          double? originalPrice =
                              double.tryParse(product['promoPrice'] ?? '');
                          double? promoPrice =
                              double.tryParse(product['price'] ?? '');

                          double discountPercentage = 0;
                          if (originalPrice != null &&
                              promoPrice != null &&
                              originalPrice > promoPrice) {
                            double discountAmount = originalPrice - promoPrice;
                            discountPercentage =
                                (discountAmount / originalPrice) * 100;
                          }
                          print('Discount Percentage: $discountPercentage');

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(FoodDetail(
                                  id: product['id'] ?? '',
                                  name: product['name'] ?? '',
                                  sizeName: product['sizeName'] ?? '',
                                  price: product['price'] ?? '',
                                  fileUrl: product['fileUrl'] ?? '',
                                  description: product['description'] ?? '',
                                ));
                              },
                              child: Container(
                                height: height * 0.30,
                                width: width * 0.45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 220, 219, 219)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.green, 
                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(14),topLeft: Radius.circular(14))
                                      ),
                                      child: Text(
                                        '${discountPercentage.toStringAsFixed(0)}% Off',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Center(
                                              child: Image(
                                                  image: AssetImage(
                                                      'assets/images/home2.png'))),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            product['name'] ?? '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(product['sizeName'] ?? ''),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Image(
                                                  image: AssetImage(
                                                      'assets/images/bag.png')),
                                               Column(
                                                children: [
                                                  Text('${originalPrice}',style: TextStyle(decoration: TextDecoration.lineThrough),),
                                                  Text('${promoPrice}',style: TextStyle(fontWeight: FontWeight.bold),)
                                                ],
                                               ),
                                              const SizedBox(
                                                width: 45,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  print(product['id']);
                                                  print(product['sizeId']);
                                                  cartController.addToCart(
                                                      context,
                                                      product['id'],
                                                      product['sizeId'],
                                                      1);
                                                },
                                                child: Container(
                                                  height: height * 0.05,
                                                  width: width * 0.1,
                                                  decoration: BoxDecoration(
                                                    color: ColorConstant.backgound,
                                                    borderRadius:
                                                        BorderRadius.circular(14),
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: ColorConstant.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Groceries',
                    style: Style.head,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(Explore());
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                            color: ColorConstant.backgound,
                            fontWeight: FontWeight.w800),
                      ))
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SingleChildScrollView(
                        child: Row(
                      children: List.generate(categoryData1.length, (index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(Explore());
                                String image = categoryData1[index]['imageUrl'];
                                String id = categoryData1[index]['_id'];
                                String name = categoryData1[index]['name'];
                              },
                              child: Container(
                                width: 280,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                  color: const Color.fromARGB(255, 201, 201, 201)),
                                  borderRadius: BorderRadius.circular(12),
                                  color: ColorConstant.extralightOrange,
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        ClipOval(
                                          child: Image.network(
                                            categoryData1[index]['imageUrl'],
                                            height: 100,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image(
                                                  image: AssetImage(
                                                      'assets/images/pulse.png'));
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          categoryData1[index]['name'],
                                        )
                                      ],
                                    )),
                              ),
                            ));
                      }),
                    )),
                  ],
                ),
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
                                      borderRadius:BorderRadius.only(topLeft: Radius.circular(12),bottomRight:Radius.circular(12))
                                    ),
                                    child: Text(
                                      '${discountPercentage.toStringAsFixed(0)}% Off',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    'assets/images/bag.png')),
                                           Column(
                                            children: [
                                            Text('${originalPrice}',style: TextStyle(decoration:TextDecoration.lineThrough),),
                                            Text('${promoPrice}',style: TextStyle(fontWeight: FontWeight.bold),)
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
                                                    color: ColorConstant.backgound,
                                                    borderRadius:
                                                        BorderRadius.circular(8)),
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
            ],
          ),
        ),
      ),
    );
  }
}


//  