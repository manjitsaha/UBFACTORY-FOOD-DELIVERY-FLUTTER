import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/home/controller/homeController.dart';
import 'package:newfigma/widgets/boxTextfield.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:sidebarx/sidebarx.dart';
import '../Product/FoodDetail.dart';
import '../cart/controller/cartControlle.dart';
import '../core/constant/color.dart';
import '../home/controller/productController.dart';
import '../widgets/filter.dart';
import 'filterModel.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  HomeController hc =HomeController();
  FilterOptions selectedFilters = FilterOptions();

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(26),topRight: Radius.circular(26))),
      context: context,
      builder: (BuildContext context) {
        double height=Get.height;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: height*1,
              decoration: BoxDecoration(
                
              borderRadius: BorderRadius.only(topRight: Radius.circular(26),topLeft: Radius.circular(26))
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Row(
                      children: [
                        IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.close)),
                        SizedBox(width: 100,),
                        Text('Filters',style: TextStyle(fontSize: 22),),
                      ],
                    )),
                    
                    Container(
                      height:height*0.88,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          SizedBox(height: 15,),
                          Text('Categories',style: Style.normal1,),
                         SizedBox(height: 15,),
                         CheckboxListTile(
                        
                        activeColor: ColorConstant.backgound,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Dosa Batter'),
                        contentPadding: EdgeInsets.all(0),
                        value: selectedFilters.dosa,
                        
                        onChanged: (value) {
                          setState(() {
                            selectedFilters.dosa = value!;
                          });
                        },
                          ),
                        CheckboxListTile(
                         controlAffinity: ListTileControlAffinity.leading,
                        activeColor: ColorConstant.backgound,
                        title: Text('Spice'),
                        contentPadding: EdgeInsets.all(0),
                        value: selectedFilters.spice,
                        onChanged: (value) {
                          setState(() {
                            selectedFilters.spice = value!;
                          });
                        },
                         ),
                        CheckboxListTile(
                         controlAffinity: ListTileControlAffinity.leading,
                        activeColor: ColorConstant.backgound,
                        title: Text('Ready to Make'),
                        contentPadding: EdgeInsets.all(0),
                        value: selectedFilters.readytomake,
                        onChanged: (value) {
                          setState(() {
                            selectedFilters.readytomake = value!;
                          });
                        },
                         ),
                         CheckboxListTile(
                         controlAffinity: ListTileControlAffinity.leading,
                        activeColor: ColorConstant.backgound,
                        title: Text('Coconut'),
                        contentPadding: EdgeInsets.all(0),
                        value: selectedFilters.coconut,
                        onChanged: (value) {
                          setState(() {
                            selectedFilters.coconut = value!;
                          });
                        },
                         ),
                         CheckboxListTile(
                         controlAffinity: ListTileControlAffinity.leading,
                        activeColor: ColorConstant.backgound,
                        title: Text('Chutney'),
                        contentPadding: EdgeInsets.all(0),
                        value: selectedFilters.chutney,
                        onChanged: (value) {
                          setState(() {
                            selectedFilters.chutney = value!;
                          });
                        },
                         ),
                         SizedBox(height: 15,),
                         Text('Other',style: Style.normal1,),
                         SizedBox(height: 15,),
                         CheckboxListTile(
                         controlAffinity: ListTileControlAffinity.leading,
                        activeColor: ColorConstant.backgound,
                        title: Text('New'),
                        contentPadding: EdgeInsets.all(0),
                        value: selectedFilters.isFeatured,
                        onChanged: (value) {
                          setState(() {
                            selectedFilters.isFeatured = value!;
                          });
                        },
                         ),
                         CheckboxListTile(
                         controlAffinity: ListTileControlAffinity.leading,
                        activeColor: ColorConstant.backgound,
                        title: Text('Price-Low-to-High'),
                        contentPadding: EdgeInsets.all(0),
                        value: selectedFilters.isOnSale,
                        onChanged: (value) {
                          setState(() {
                            selectedFilters.isOnSale = value!;
                          });
                        },
                         ),
                        SizedBox(height: 16),Spacer(),
                        // Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // children: [
                        //   ButtonWidget(
                        //     border: BorderSide(color: ColorConstant.blue),
                        //     width: Get.width*0.35,height: Get.height*0.05,
                        //     onPressed: () {
                        //       setState(() {
                        //         selectedFilters.reset();
                        //       });
                        //       Navigator.pop(context);
                        //     },
                        //     backgroundColor:Colors.white, text: 'Cancel', textColor: ColorConstant.blue,
                            
                        //   ),
                        //   ButtonWidget(
                        //   border: BorderSide(color: ColorConstant.blue),
                        //     width: Get.width*0.35,height: Get.height*0.05,
                        //     onPressed: () {
                        //       Navigator.pop(context);
                        //     },
                        //     backgroundColor: Colors.white,
                        //     text: 'Apply',
                        //     textColor: ColorConstant.blue,
                            
                        //   ),
                        // ],
                        //                   ),
                        //   ],
                  SizedBox(height: 50,),
                  ButtonWidget(onPressed: (){Navigator.pop(context);}, text: 'Apply Filter', backgroundColor: ColorConstant.backgound, textColor: ColorConstant.white)
                  ]),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<Map<String, dynamic>> product = [];

  Future<void> fetchProductData() async {
    List<Map<String, dynamic>> productData = await hc.getproduct();
    setState(() {
      product = productData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProductData();
    hc.getproduct();
  }

  @override
  Widget build(BuildContext context) {
    CartController cartController = CartController();

    double height = Get.height;
    double width = MediaQuery.of(context).size.width;
    int itemsPerRow = 2;

    double itemWidth = (width - 24.0 - (itemsPerRow - 1) * 8.0) / itemsPerRow;

    return Scaffold(
      // drawer: Drawer(
      //   child: SidebarX(
      //       controller: SidebarXController(selectedIndex: 0),
      //       items: const [
      //         SidebarXItem(icon: Icons.home, label: 'Home'),
      //         SidebarXItem(icon: Icons.search, label: 'Search'),
      //       ],
      //     ),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 50, 8, 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BoxTextField(
                    borderRadius: 12,
                    showBorder: false,
                    hint: 'Search',
                    prefixIcon: Icons.search,
                    width: width * 0.7,
                  ),
                  IconButton(
                    onPressed: () {
                      _showFilterBottomSheet(context);
                    },
                    icon: Icon(Icons.tune),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Wrap(
                spacing: 8.0,
                runSpacing: 12.0,
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

                  return GestureDetector(
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
                      width: itemWidth + 2,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 201, 201, 201),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                              ),
                              child: Text(
                                '${discountPercentage.toStringAsFixed(0)}% Off',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Center(
                              child: Image(
                                image: AssetImage('assets/images/home2.png'),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(product[index]['name']),
                            Text(product[index]['sizeName']),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Image(
                                //   image: AssetImage('assets/images/Rupee.png'),
                                // ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 12),
                                 child: Column(
                                  children: [
                                  
                                                             Text( '₹${product[index]['promoPrice']}',  style: TextStyle(decoration: TextDecoration.lineThrough,
                                 ),),
                                 Text('₹${product[index]['price']}', style: TextStyle(fontWeight: FontWeight.bold,
                                  ),),
                                  ],
                                 ),
                               ),
                                SizedBox(width: 65),
                                GestureDetector(
                                  onTap: () {
                                    cartController.addToCart(
                                      context,
                                      product[index]['id'],
                                      product[index]['sizeId'],
                                      1,
                                    );
                                  },
                                  child: Container(
                                    height: height * 0.05,
                                    width: width * 0.1,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.backgound,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Icon(Icons.add,color: Colors.white,),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  RichText(
//                                   text: TextSpan(
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 16,
//                                     ),
//                                     children: [
//                                       TextSpan(
//                                         text:
//                                       ),
//                                       TextSpan(text: '  '),
//                                       TextSpan(
//                                         text: 
//                                       ),
//                                     ],
//                                   ),
//                                 ),