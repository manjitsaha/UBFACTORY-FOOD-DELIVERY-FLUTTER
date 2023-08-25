import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/widgets/boxTextfield.dart';

import '../home/controller/categoryController.dart';
import '../home/controller/productController.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
   List<Map<String, dynamic>> categoryData1= [];
  Future<void> fetchCategoryData() async {
    List<Map<String, dynamic>> categoryData = await getcategory();
    setState(() {
      categoryData1 = categoryData;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategoryData();
    getproduct();
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
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child: Column(
          children: [
            BoxTextField(hint: 'Search Store',prefixIcon: Icons.search,),
            SizedBox(height:10,),
            Wrap(
              spacing: 12.0, 
              runSpacing: 12.0, 
              children: List.generate(categoryData1.length, (index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: (width - 24.0 - (itemsPerRow - 1) * 8.0) / itemsPerRow, 
                    height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 201, 201, 201),
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: ColorConstant.extralightOrange,
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