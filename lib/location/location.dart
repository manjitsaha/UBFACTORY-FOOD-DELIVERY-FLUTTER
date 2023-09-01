import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/routes/AppRoutes.dart';
import 'package:newfigma/widgets/button.dart';

import '../widgets/dropdown.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            IconButton(onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.arrow_back_ios)),
            const Center(child: Image(image: AssetImage('assets/images/location.png'))),
            Center(child: Text('Select Your location',style: Style.heading,)),
            const SizedBox(height: 5,),
            const Center(child: Text('Switch on your location to stay in tune with\n whats happening in your area',textAlign: TextAlign.center,)),
            const SizedBox(height: 20,),
            const Text('Your Zone'),
            DropdownTextFieldWidget(hintText: 'Banglore', 
            onChanged: (value){print('Selected option: $value');}, options: const ['Banglore','Pune','Gurugram','Delhi'],), 
            const SizedBox(height: 10,),
            const Text('Your Area'),
            DropdownTextFieldWidget(options: const ['Urban','Rural'],
             hintText: 'Types of your area', 
             onChanged: (value){print(('Selected option: $value'));}),
             const SizedBox(height: 24,),
             ButtonWidget(onPressed: (){
              
              Get.toNamed(AppRoutes.tabhome);
             },
              text: 'Submit',
               backgroundColor: ColorConstant.backgound, 
               textColor: ColorConstant.white)
            ],
          ),
        ),
      ),
    );
  }
}