import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/ColorModel/Color_Model.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/home/controller/homeController.dart';
import 'package:newfigma/search/search.dart';
import 'package:newfigma/widgets/boxTextfield.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  HomeController hc = HomeController();
 List<ColorModel> colors = [];
  late int Function() generateRandom;
  
 


   List<Map<String, dynamic>> categoryData1= [];
  Future<void> fetchCategoryData() async {
    List<Map<String, dynamic>> categoryData = await hc.getcategory();
    setState(() {
      categoryData1 = categoryData;
    });
  }
 void initState() {
    super.initState();
    fetchCategoryData();
    hc.getproduct();
   colors = [
      ColorModel(
        backgorundColor: ColorConstant.extralightGreen,
        borderColor: ColorConstant.lightGreen,
      ),
      ColorModel(
        backgorundColor: ColorConstant.extralightOrange,
        borderColor: ColorConstant.lightOrange,
      ),
    ];

    generateRandom = () {
      Random random = Random();
      int min = 0, max = colors.length - 1;
      int num = min + random.nextInt(max - min + 1);
      return num;
    };

  }

  @override
Widget build(BuildContext context) {
  
  double width = Get.width;
  int itemsPerRow = 2; 

  return Scaffold(
    
    appBar: AppBar(
      backgroundColor: ColorConstant.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 60),
        child: Text(
          'Find Products',
          style: TextStyle(
            color: ColorConstant.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    body: Padding(
      padding:  EdgeInsets.fromLTRB(8, 5, 8, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child: Column(
          children: [
            BoxTextField(hint: 'Search Store',prefixIcon: Icons.search,showBorder: false,borderRadius: 12,),
            SizedBox(height:10,),
            Wrap(
              spacing: 12.0, 
              runSpacing: 12.0, 
              children: List.generate(categoryData1.length, (index) {
                 int randomIndex = generateRandom();
                  ColorModel selectedColor = colors[randomIndex];
                return GestureDetector(
                  onTap: () {
                    Get.to(Search());
                  },
                  child: Container(
                    width: (width - 24.0 - (itemsPerRow - 1) * 8.0) / itemsPerRow, 
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedColor.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                       color: selectedColor.backgorundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipOval(
                            child: Image.network(
                              categoryData1[index]['imageUrl'],
                              height: 100,
                              errorBuilder: (context, error, stackTrace) {
                                return Image(
                                  image: AssetImage('assets/images/pulse.png'),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 20), 
                          Flexible(
                            child: Text(categoryData1[index]['name']),
                          ),
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