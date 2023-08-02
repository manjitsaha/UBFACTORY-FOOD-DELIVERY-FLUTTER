import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/filters/filter.dart';
import 'package:newfigma/widgets/boxTextfield.dart';

import '../core/constant/color.dart';

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
    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.close_outlined)),
                    const BoxTextField(hint: 'Egg',prefixIcon: Icons.search,width: 270,),
                    GestureDetector(
                    onTap: () {
                      Get.to(const Filters());
                    },  
                    child: const Icon(Icons.tune))
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color.fromARGB(255, 215, 214, 214))
                  ),
                  height: height*0.32,width: width*0.44,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(child: Image(image: AssetImage('assets/images/s1.png'))),
                        const SizedBox(height: 0,),
                        const Text('Egg Chicken Red',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                        const Text('4 Pcs, Price'),
                        const SizedBox(height: 20,),
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
                const SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color.fromARGB(255, 215, 214, 214))
                  ),
                  height: height*0.32,width: width*0.44,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        const Center(child: Image(image: AssetImage('assets/images/s2.png'))),
                        const SizedBox(height:10,),
                        const Text('Egg Chicken Red',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                        const Text('4 Pcs, Price'),
                        const SizedBox(height: 17,),
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
                  height: height*0.32,width: width*0.44,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        const Center(child: Image(image: AssetImage('assets/images/s3.png'))),
                        const SizedBox(height: 15,),
                        const Text('Egg Chicken Red',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                        const Text('4 Pcs, Price'),
                        const SizedBox(height: 20,),
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
                const SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color.fromARGB(255, 215, 214, 214))
                  ),
                  height: height*0.32,width: width*0.44,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 13,),
                        const Center(child: Image(image: AssetImage('assets/images/s4.png'))),
                        const SizedBox(height:10,),
                        const Text('Egg Chicken Red',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                        const Text('4 Pcs, Price'),
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
                height: height*0.32,width: width*0.44,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      const Center(child: Image(image: AssetImage('assets/images/s5.png'))),
                      const SizedBox(height: 10,),
                      const Text('Egg Chicken Red',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      const Text('4 Pcs, Price'),
                      const SizedBox(height: 20,),
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
              const SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color.fromARGB(255, 215, 214, 214))
                ),
                height: height*0.32,width: width*0.44,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      const Center(child: Image(image: AssetImage('assets/images/s6.png'))),
                      const SizedBox(height:30,),
                      const Text('Egg Chicken Red',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                      const Text('4 Pcs, Price'),
                      const SizedBox(height: 18,),
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
              )
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}