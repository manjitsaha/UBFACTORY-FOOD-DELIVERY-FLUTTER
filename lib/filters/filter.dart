import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:newfigma/widgets/checkbox.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    double height=Get.height;
    double width=Get.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.white,
        elevation: 0,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.close_outlined,color: ColorConstant.black,)),
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text('Filters',style: TextStyle(color: ColorConstant.black,fontWeight: FontWeight.w700,fontSize: 24),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: width*1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 232, 232),
            borderRadius: BorderRadius.circular(20)
            ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories',style: Style.heading,),
              const SizedBox(height: 10,),
              const MyCheckboxWidget(checkboxText: 'Eggs'),
              const MyCheckboxWidget(checkboxText: 'Noodles & Pasta'),
              const MyCheckboxWidget(checkboxText: 'Chips & Crisp'),
              const MyCheckboxWidget(checkboxText: 'Fast Food'),
              const SizedBox(height: 20,),
              Text('Brand',style: Style.heading,),
              const SizedBox(height: 10,),
              const MyCheckboxWidget(checkboxText: 'Indivisual Collection'),
              const MyCheckboxWidget(checkboxText: 'Eggos'),
              const MyCheckboxWidget(checkboxText: 'Parle'),
              const MyCheckboxWidget(checkboxText: 'Kazi Farmas'),
              const SizedBox(height: 130,),
              ButtonWidget(onPressed: (){
                Get.back();
              }, 
              text: 'Apply Filters',
               backgroundColor: ColorConstant.backgound, textColor: ColorConstant.white)
            ],
          ),
        ),
        ),
      ),
    );
  }
}