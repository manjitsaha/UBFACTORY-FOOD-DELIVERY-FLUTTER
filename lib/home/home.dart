import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/Product/FoodDetail.dart';
import 'package:newfigma/cart/controller/cartControlle.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/explore/explore.dart';
import 'package:newfigma/home/controller/categoryController.dart';
import 'package:newfigma/home/controller/discountController.dart';
import 'package:newfigma/home/controller/productController.dart';
import 'package:newfigma/search/search.dart';
import 'package:newfigma/widgets/boxTextfield.dart';
import 'controller/bestsellingController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map<String, dynamic>> discountData = [];
  Future<void> fetchDiscountData() async {
    List<Map<String, dynamic>> extractedData = await discount();
    setState(() {
      discountData = extractedData;
    });
  }
  List<Map<String, dynamic>> bestSellingData= [];
  Future<void> fetchBestSelling() async {
    List<Map<String, dynamic>> bestData = await bestselling();
    setState(() {
      bestSellingData = bestData;
    });
  }
   List<Map<String, dynamic>> categoryData1= [];
  Future<void> fetchCategoryData() async {
    List<Map<String, dynamic>> categoryData = await getcategory();
    setState(() {
      categoryData1 = categoryData;
    });
  }
   List<Map<String, dynamic>> product= [];
  Future<void> fetchProductData() async {
    List<Map<String, dynamic>> productData = await getproduct();
    setState(() {
      product = productData;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    discount();
    fetchDiscountData();
    bestselling();
    fetchBestSelling();
    getcategory();
    fetchCategoryData();
    getproduct();
    fetchProductData();
  }
 CartController cartController=CartController();
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
                Text('Same day Delivery.',style: Style.greenhead),
                Text('Order by 11:00am and we will deliver by 6:00pm',style: Style.greensmall,),
                const BoxTextField(hint: 'Search Store',prefixIcon: Icons.search,),
                const SizedBox(height: 10,),
                 SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                children: List.generate(discountData.length, (index) {
                
                return GestureDetector(
                onTap: () {
              String id = discountData[index]['_id'];
             },
           child: Container(
            
            decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
            borderRadius: BorderRadius.circular(12),
          ),
          child:Image.network(
                    discountData[index]['imageUrl'], 
                    height: 50,width: 500, 
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Image.asset('assets/images/banner.png'); 
                },
              ),
        )
      );
  })
      )
      ),
               
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
                     SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(bestSellingData.length, (index) {
                  final product = bestSellingData[index];
                  
                  double? originalPrice =double.tryParse(product['promoPrice']??'');
                  double? promoPrice =double.tryParse(product['price']??'');

                  double discountPercentage =0;
                  if (originalPrice != null && promoPrice != null && originalPrice > promoPrice) {
                    double discountAmount = originalPrice - promoPrice;
                    discountPercentage = (discountAmount / originalPrice) * 100;
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
                        height: height * 0.32,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(product['name'] ?? ''),
                  Text(product['sizeName'] ?? ''),
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
                            text: '$originalPrice',
                            style: TextStyle(decoration: TextDecoration.lineThrough),
                          ),
                          TextSpan(text: '  '), // Add some spacing between the prices
                          TextSpan(
                            text: '$promoPrice',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                      const SizedBox(width: 45,),
                      GestureDetector(
                        onTap:  (){
                          print(product['id']);
                          print(product['sizeId']);
                          
                        cartController.getaddToCart({
                       'id': product['id'],
                       'name': product['name'],
                        });
                         ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Item added to cart'),
                          duration: Duration(seconds: 2), 
                        ),
                      );
                        },
                        child: Container(
                          height: height * 0.05,
                          width: width * 0.1,
                          decoration: BoxDecoration(
                            color: ColorConstant.backgound,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.add),
                        ),
                      ),
                      
                    ],
                  ),
                ],
              ),
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
                const SizedBox(height: 10,),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Groceries',style: Style.head,),
                  TextButton(onPressed: () {
                    Get.to(Explore());
                  },
                  child: Text('See all',style: TextStyle(color: ColorConstant.backgound,fontWeight: FontWeight.w800),))
                ],),
               
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
                                child:  Container(
                                width: 280,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
                                  borderRadius: BorderRadius.circular(12),
                                  color: ColorConstant.extralightOrange,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:Row(
                                    children: [
                                      ClipOval(
                                        child: Image.network(categoryData1[index]['imageUrl'],height: 100,
                                        errorBuilder:(context, error, stackTrace) {
                                         return Image(image: AssetImage('assets/images/pulse.png'));
                                        },
                                        ),
                                      
                                      ),
                                      SizedBox(width: 30,),
                                      Text(categoryData1[index]['name'],)
                                    ],
                                  )
                              ),
                              ),
                         )
                         );
                      }),
                     )
                      ),
                      
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
                      double? originalPrice =double.tryParse(product[index]['promoPrice']??'');
                      double? promoPrice =double.tryParse(product[index]['price']??'');

                      double discountPercentage =0;
                      if (originalPrice != null && promoPrice != null && originalPrice > promoPrice) {
                        double discountAmount = originalPrice - promoPrice;
                        discountPercentage = (discountAmount / originalPrice) * 100;
                      }
                      
                         return Padding(
                           padding:  EdgeInsets.all(8.0),
                           child: GestureDetector(
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
                                width: width*0.6,
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color.fromARGB(255, 201, 201, 201)),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(10.0),
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
                                              text: product[index]['price'],
                                              style: TextStyle(decoration: TextDecoration.lineThrough),
                                            ),
                                            TextSpan(text: '  '), 
                                            TextSpan(
                                              text: product[index]['promoPrice'],
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 45,),
                                      GestureDetector(
                                        onTap: (){
                                        cartController.getaddToCart({
                                        'id': product[index]['id'],
                                        'name': product[index]['name'],
                                        
                                      });
                                         
                                          ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Item added to cart'),
                                            duration: Duration(seconds: 2), 
                                          ),
                                        );
                                        },
                                        child: Container(
                                          height: height*0.05,width: width*0.1,
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
                           ),
                         );
                      }),
                      
                     )
                      ),
                      IconButton(onPressed: (){
                      Get.to(Search());
                      }, icon: Icon(Icons.arrow_forward_ios)),
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


//  