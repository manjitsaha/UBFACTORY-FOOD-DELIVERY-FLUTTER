import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/Product/FoodDetail.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';

import '../Product/favouriteController.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesController = Get.put(FavoritesController());

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text('Favourites',style: TextStyle(color: ColorConstant.black,fontSize: 24),),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (favoritesController.favorites.isEmpty) {
          return Center(child: Text('No favorites yet.',style: Style.smallHead,));
        }
      
        return ListView.builder(
          itemCount: favoritesController.favorites.length,
          itemBuilder: (context, index) {
            final item = favoritesController.favorites[index];
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Divider(thickness: 2,),
                  SizedBox(height: 10,),
                  ListTile(
                   leading: Image(image: AssetImage('assets/images/home2.png')),
                    title: Text(item['name']),
                    subtitle: Text(item['sizeName']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/images/bag.png')),
                          Text(item['price']),
                          IconButton(onPressed: (){
                            Get.to(FoodDetail(id: item['id'], name: item['name'], sizeName: item['sizeName'], price: item['price'], fileUrl: item['fileUrl'], description: item['description']));
                          },icon: Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                    ),
                  ),
                
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
