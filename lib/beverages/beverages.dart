import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key});

  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  @override
  Widget build(BuildContext context) {
    double height=Get.height;
    double width=Get.width;
    return Scaffold(
    appBar: AppBar(
      leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new_outlined,color: ColorConstant.black,)),
      backgroundColor: ColorConstant.white,
      elevation: 0,
      actions: [IconButton(onPressed: (){}, icon: Icon(Icons.tune_outlined,color: ColorConstant.black,))],
      title: Padding(
        padding: const EdgeInsets.only(left: 70),
        child: Text('Beverages',style: TextStyle(fontWeight: FontWeight.w700,color: ColorConstant.black),),
      ),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color.fromARGB(255, 215, 214, 214))
                ),
                height: height*0.34,width: width*0.44,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Image(image: AssetImage('assets/images/b1.png'))),
                      const SizedBox(height: 20,),
                      const Text('Diet Coke',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      const Text('355ml, Price'),
                      const SizedBox(height: 40,),
                     Row(children: [
                      const Image(image: AssetImage('assets/images/Rupee.png')),
                      const Text('50'),
                      const SizedBox(width: 50,),
                      Container(
                      height: height*0.05,width: width*0.1,
                      decoration: BoxDecoration(
                      color: ColorConstant.backgound,
                      borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Icon(Icons.add),
                      ),      
                     ],)
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color.fromARGB(255, 215, 214, 214))
                ),
                height: height*0.34,width: width*0.44,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Image(image: AssetImage('assets/images/b2.png'))),
                      const SizedBox(height: 20,),
                      const Text('Sprite Can',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      const Text('355ml, Price'),
                      const SizedBox(height: 38,),
                     Row(children: [
                      const Image(image: AssetImage('assets/images/bag.png')),
                      const Text('50'),
                      const SizedBox(width: 50,),
                      Container(
                      height: height*0.05,width: width*0.1,
                      decoration: BoxDecoration(
                      color: ColorConstant.backgound,
                      borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Icon(Icons.add),
                      ),      
                     ],)
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color.fromARGB(255, 215, 214, 214))
                ),
                height: height*0.34,width: width*0.44,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Image(image: AssetImage('assets/images/b3.png'))),
                      const SizedBox(height: 10,),
                      const Text('Apple & Grape\nJuice',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      const Text('355ml, Price'),
                      const SizedBox(height: 15,),
                     Row(children: [
                      const Image(image: AssetImage('assets/images/bag.png')),
                      const Text('50'),
                      const SizedBox(width: 50,),
                      Container(
                      height: height*0.05,width: width*0.1,
                      decoration: BoxDecoration(
                      color: ColorConstant.backgound,
                      borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Icon(Icons.add),
                      ),      
                     ],)
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color.fromARGB(255, 215, 214, 214))
                ),
                height: height*0.34,width: width*0.44,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Image(image: AssetImage('assets/images/b4.png'))),
                      const SizedBox(height: 15,),
                      const Text('Orange Juice',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      const Text('355ml, Price'),
                      const SizedBox(height: 40,),
                     Row(children: [
                      const Image(image: AssetImage('assets/images/bag.png')),
                      const Text('50'),
                      const SizedBox(width: 50,),
                      Container(
                      height: height*0.05,width: width*0.1,
                      decoration: BoxDecoration(
                      color: ColorConstant.backgound,
                      borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Icon(Icons.add),
                      ),      
                     ],)
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color.fromARGB(255, 215, 214, 214))
                ),
                height: height*0.34,width: width*0.44,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Image(image: AssetImage('assets/images/b5.png'))),
                      const SizedBox(height: 20,),
                      const Text('Coca Cola Can',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      const Text('355ml, Price'),
                      const SizedBox(height: 30,),
                     Row(children: [
                      const Image(image: AssetImage('assets/images/bag.png')),
                      const Text('50'),
                      const SizedBox(width: 50,),
                      Container(
                      height: height*0.05,width: width*0.1,
                      decoration: BoxDecoration(
                      color: ColorConstant.backgound,
                      borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Icon(Icons.add),
                      ),      
                     ],)
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color.fromARGB(255, 215, 214, 214))
                ),
                height: height*0.34,width: width*0.44,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Image(image: AssetImage('assets/images/b6.png'))),
                      const SizedBox(height: 20,),
                      const Text('Pepsi Can',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      const Text('355ml, Price'),
                      const SizedBox(height: 30,),
                     Row(children: [
                      const Image(image: AssetImage('assets/images/bag.png')),
                      const Text('50'),
                      const SizedBox(width: 50,),
                      Container(
                      height: height*0.05,width: width*0.1,
                      decoration: BoxDecoration(
                      color: ColorConstant.backgound,
                      borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Icon(Icons.add),
                      ),      
                     ],)
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