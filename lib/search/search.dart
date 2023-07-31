import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/widgets/boxTextfield.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    double height=Get.height;
    double width=Get.width;
    return Scaffold(
    appBar: AppBar(
      backgroundColor: ColorConstant.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 60),
        child: Text('Find Products',style: TextStyle(color: ColorConstant.black,fontWeight: FontWeight.w600),),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BoxTextField(hint: 'Search',prefixIcon: Icons.search_outlined,),
            const SizedBox(height: 15,),
            Row(
              children: [
                Container(
                  height: height*0.24,
                  width: width*0.44,
                  decoration: BoxDecoration(
                    color: ColorConstant.extralightGreen,
                    border: Border.all(color: ColorConstant.backgound),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/p1.png')),
                        SizedBox(height: 20),
                        Text('Fresh Fruits\n& Vegetables',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  height: height*0.24,
                  width: width*0.44,
                  decoration: BoxDecoration(
                    color: ColorConstant.extralightOrange,
                    border: Border.all(color: ColorConstant.orange),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/p2.png')),
                        SizedBox(height: 20),
                        Text('Fresh Fruits\n& Vegetables',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 15,),
            Row(
              children: [
                Container(
                  height: height*0.24,
                  width: width*0.44,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightred,
                    border: Border.all(color: ColorConstant.red),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Image(image: AssetImage('assets/images/p3.png'),height: 100,)),
                        SizedBox(height: 5),
                        Text('Spices',style: TextStyle(fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  height: height*0.24,
                  width: width*0.44,
                  decoration: BoxDecoration(
                    color: ColorConstant.lightpurple,
                    border: Border.all(color: ColorConstant.purple),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(22.0),
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/p4.png'),height: 100,),
                        SizedBox(height: 10),
                        Text('Bakery & Snacks',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Container(
                  height: height*0.24,
                  width: width*0.44,
                  decoration: BoxDecoration(
                    color: ColorConstant.extralightGreen,
                    border: Border.all(color: ColorConstant.backgound),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/p5.png'),height: 100,),
                        SizedBox(height: 10),
                        Text('Beverages',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  height: height*0.24,
                  width: width*0.44,
                  decoration: BoxDecoration(
                    color: ColorConstant.extralightOrange,
                    border: Border.all(color: ColorConstant.orange),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/p2.png')),
                        SizedBox(height: 20),
                        Text('Fresh Fruits\n& Vegetables',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Container(
                  height: height*0.24,
                  width: width*0.44,
                  decoration: BoxDecoration(
                    color: ColorConstant.extralightGreen,
                    border: Border.all(color: ColorConstant.backgound),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/p1.png')),
                        SizedBox(height: 20),
                        Text('Fresh Fruits\n& Vegetables',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  height: height*0.24,
                  width: width*0.44,
                  decoration: BoxDecoration(
                    color: ColorConstant.extralightOrange,
                    border: Border.all(color: ColorConstant.orange),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/p2.png')),
                        SizedBox(height: 20),
                        Text('Fresh Fruits\n& Vegetables',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    );
  }
}