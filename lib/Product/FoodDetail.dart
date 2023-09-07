import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../cart/controller/cartControlle.dart';
import '../utils/api_endpoint.dart';
import 'favouriteController.dart';
import 'package:html/parser.dart' as parser;

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key,
   required this.id,
    required this.name, 
    required this.sizeName, 
    required this.price, 
    required this.fileUrl, 
    required this.description,
    
    });
   final String id;
    final String name;
    final String sizeName;
    final String price;
    final String fileUrl;
    final String description;
   
     

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}


class _FoodDetailState extends State<FoodDetail> {
 bool isFavourite =false;
final favoritesController = Get.put(FavoritesController());
@override
  void initState() {
    super.initState();
    checkIfFavorite();
  }

  void checkIfFavorite() {
    isFavourite = favoritesController.isProductFavorite(widget.id);
    setState(() {});
  }

Future<void> toggleFavorite() async {
  SharedPreferences passtoken = await SharedPreferences.getInstance();
  String? token = passtoken.getString('newtoken');
  if (isFavourite) {
      favoritesController.addToFavorites({
        'id': widget.id,
        'name': widget.name,
        'sizeName': widget.sizeName,
        'price': widget.price,
        'fileUrl': widget.fileUrl,
        'description': widget.description,
      });
    } else {
      favoritesController.removeFromFavorites(widget.id);
    }
  var url = Uri.parse(
    ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.addWishList,
  );

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'productId': widget.id,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        isFavourite = !isFavourite;
      });

      
      final snackBar = SnackBar(
        content: Text(isFavourite ? 'Added to favorites' : 'Removed from favorites'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
        if (isFavourite) {
      final favoritesController = Get.put(FavoritesController());
      favoritesController.addToFavorites({
        'id': widget.id,
        'name': widget.name,
        'sizeName': widget.sizeName,
        'price': widget.price,
        'fileUrl': widget.fileUrl,
        'description': widget.description,
      });
    
    } else {
      final favoritesController = Get.find<FavoritesController>();
      favoritesController.removeFromFavorites(widget.id);
    }
    
    } else {
      print('Failed to add/remove item from wishlist');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  } catch (e) {
    print(e);
  }
}


    int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }
  String cleanDescription(String htmlDescription) {
    var document = parser.parse(htmlDescription);
    String plainText = parser.parse(document.body!.text).documentElement!.text;
    return plainText;
  }

  @override
  Widget build(BuildContext context) {
    
    double height=Get.height;
    double width=Get.width;
    return Scaffold(
      // appBar: AppBar(
      //   leading: GestureDetector(
      //   onTap: (){Get.back();},
      //   child: Icon(Icons.arrow_back_ios,color: ColorConstant.black,)
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children:[ 
                 Image(
              image:AssetImage('assets/images/dosa.png'),
                      width: MediaQuery.of(context).size.width*1,
                      height: MediaQuery.of(context).size.height*0.3,
                      fit: BoxFit.cover,
                    ),
                    // Blurred overlay
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                        child: Container(
              color: Colors.white.withOpacity(0.5), // Adjust opacity as needed
                        ),
                      ),
                    ),
                    // Overlay image
                    Center(
                      child: Image(
                        image:AssetImage('assets/images/dosa.png'),
                        width: 300,
                        height: 300,
                      ),
                    ),
              Positioned(child: 
               IconButton(onPressed: (){
                Get.back();
               }, icon: Icon(Icons.arrow_back_ios))
              ),
              Positioned(
                right: 15,
                top: 15,
                child:GestureDetector(
                onTap: () {
                toggleFavorite(); 
                },
                child: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_outline,
                color: isFavourite ? Colors.red : Colors.black, 
                size: 28,
                ),
              ), )
                        ]),
              SizedBox(height: 5,),
             Padding(
               padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(widget.name,style: Style.heading,),
                   
                   ],),
                   Text(widget.sizeName),
                         const SizedBox(height: 10,),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(width: 180,
                          
                           child: Row(
                           children: [
                            GestureDetector(
                              onTap: _decrement,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Container(width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                            child:Center(child: Text('$_quantity',style: const TextStyle(fontSize: 16),)),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: _increment,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: const Icon(Icons.add),
                              ),
                            ),
                              ],
                           ),
                         ),
                       
                        Row(
                          children: [
                            Image(image: AssetImage('assets/images/Rupee.png')),
                            Text(widget.price,),
                          ],
                        )
                         ],),
                         const SizedBox(height: 10,),
                         const Divider(thickness: 2,),
                         const SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Text('Product Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                           IconButton(onPressed: (){

                           }, icon: Icon(Icons.keyboard_arrow_down))
                          ],
                        ),
                         const SizedBox(height: 10,),
                   Text(cleanDescription(widget.description)),
                         const SizedBox(height: 10,),
                         
                         const SizedBox(height: 10,),
                         const Divider(thickness: 2,),
                         const SizedBox(height: 10,),
                         const Row(
                    children: [
                    Text('Review',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
                   Spacer(),
                    Image(image: AssetImage('assets/images/stars.png')),
                    Icon(Icons.arrow_forward_ios,size: 16,)
                         ],),
                         const SizedBox(height: 50,),
                         ButtonWidget(onPressed: (){
                         
                         },
                   text: 'Add to Cart',
                    backgroundColor: ColorConstant.backgound, textColor: ColorConstant.white,
                         ),
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}