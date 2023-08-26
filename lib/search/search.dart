import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/widgets/boxTextfield.dart';
import '../Product/FoodDetail.dart';
import '../cart/controller/cartControlle.dart';
import '../core/constant/color.dart';
import '../home/controller/productController.dart';
import 'filterModel.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FilterOptions selectedFilters = FilterOptions();

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filter Options'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
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
                    title: Text('Price-Low-To-High'),
                    contentPadding: EdgeInsets.all(0),
                    value: selectedFilters.isOnSale,
                    onChanged: (value) {
                      setState(() {
                        selectedFilters.isOnSale = value!;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  selectedFilters.reset();
                });
                Navigator.pop(context);
              },
              child: Text('Reset'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  List<Map<String, dynamic>> product = [];

  Future<void> fetchProductData() async {
    List<Map<String, dynamic>> productData = await getproduct();
    setState(() {
      product = productData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProductData();
    getproduct();
  }

  @override
  Widget build(BuildContext context) {
    CartController cartController=CartController();

    double height = Get.height;
    double width = MediaQuery.of(context).size.width; 
    int itemsPerRow = 2;

    double itemWidth = (width - 24.0 - (itemsPerRow - 1) * 8.0) / itemsPerRow;

    return Scaffold(
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
                    hint: 'Search',
                    prefixIcon: Icons.search,
                    width: width * 0.7,
                  ),
                  IconButton(
                    onPressed: () {
                      _showFilterDialog(context);
                    },
                    icon: Icon(Icons.tune),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Wrap(
                spacing: 8.0,
                runSpacing: 12.0,
                children: List.generate(product.length, (index) {
                      double? originalPrice =double.tryParse(product[index]['promoPrice']??'');
                      double? promoPrice =double.tryParse(product[index]['price']??'');

                      double discountPercentage =0;
                      if (originalPrice != null && promoPrice != null && originalPrice > promoPrice) {
                        double discountAmount = originalPrice - promoPrice;
                        discountPercentage = (discountAmount / originalPrice) * 100;
                      }
                      
                         return GestureDetector(
                           onTap: () {
                          Get.to(FoodDetail(
                          id: product[index]['id']??'',
                          name: product[index]['name']??'',
                          sizeName: product[index]['sizeName']??'',
                          price: product[index]['price']??'',
                          fileUrl: product[index]['fileUrl']??'',
                          description:product[index]['description'],
                          
                          ));
                         
                           },
                            child:  Container(
                              height: height*0.32,
                              width: itemWidth+2,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(5.0),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green, // Choose the color you prefer
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '${discountPercentage.toStringAsFixed(0)}% Off',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12
                                    ),
                                  ),
                                ),
                                  const Center(child: Image(image: AssetImage('assets/images/home2.png'))),
                                  const SizedBox(height: 10,),
                                  Text(product[index]['name']),
                                  Text(product[index]['sizeName']),
                                  const SizedBox(height: 15,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    const Image(image: AssetImage('assets/images/bag.png')),
                                     RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        children: [
                                          
                                          TextSpan(
                                            text: product[index]['promoPrice'],
                                            style: TextStyle(decoration: TextDecoration.lineThrough),
                                          ),
                                          TextSpan(text: '  '), 
                                          TextSpan(
                                            text: product[index]['price'],
                                            style: TextStyle(fontWeight:FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 45,),
                                    GestureDetector(
                                      onTap: (){
                                    cartController.addToCart(product[index]['id'], product[index]['sizeId'], 1);
                                      },
                                      child: Container(
                                        height: height*0.05,
                                        width: width*0.1,
                                        decoration: BoxDecoration(
                                          color: ColorConstant.backgound,
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: const Icon(Icons.add),
                                      ),
                                    ),
                                  ],)
                                ],),
                              ),
                            ),
                         );
                      }),
                      
                
                
               )
            ]
          )
        )
      )
    );
  }
}