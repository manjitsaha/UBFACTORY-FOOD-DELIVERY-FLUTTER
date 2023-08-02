import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/widgets/button.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: (){Get.back();},
               icon: const Icon(Icons.arrow_back_ios)),
               Divider(thickness: 2,color: ColorConstant.white,),
               Center(
                 child: Material(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 20,
                   child: Container(
                    height: 150,
                    width: 350,
                    decoration: BoxDecoration(
                      color: ColorConstant.backgound,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('One Subscription',style: Style.whiteHeading,),
                          Text('Subscribe and recieve our newsletters to follow the news about our fresh.',style: Style.whitesmall,)
                        ],
                      ),
                    ) ,
                   ),
                 ),
               ),
               const SizedBox(height: 20,),
               Center(
                 child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                     height: 150,
                      width: 350,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color.fromARGB(255, 223, 201, 4),Color.fromARGB(209, 42, 148, 46),Colors.red],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Image(image: AssetImage('assets/images/sub.png')),
                              SizedBox(width: 20,),
                              Text('Small Order Friendly')
                            ],
                          ),
                             Row(
                            children: [
                              Image(image: AssetImage('assets/images/sub.png')),
                              SizedBox(width: 20,),
                              Text('Save of rs 700 Graduated!!!')
                            ],
                          ),
                             Row(
                            children: [
                              Image(image: AssetImage('assets/images/sub.png')),
                              SizedBox(width: 20,),
                              Text('Small Order Friendly')
                            ],
                          ),
                         ],
                      ),
                    ),
                  ),
                 ),
               ),
               const Padding(
                 padding: EdgeInsets.all(15.0),
                 child: Text('Subscribe and receive our newsletters to follow the news about our fresh'),
               ),
              const SizedBox(height: 10,),
              Text('FAQ',style: Style.smallHead,),
              Divider(thickness: 2,color: ColorConstant.white,),
               const Padding(
                 padding: EdgeInsets.all(10.0),
                 child: Text('Subscribe and receive our newsletters to follow the news about our fresh'),
               ),
               Divider(thickness: 2,color: ColorConstant.white,),
               const Padding(
                 padding: EdgeInsets.all(10.0),
                 child: Text('Subscribe and receive our newsletters to follow the news about our fresh'),
               ),
              Divider(thickness: 2,color: ColorConstant.white,),
              const SizedBox(height: 10,),
              ButtonWidget(onPressed: (){},
               text: 'Select Plan', backgroundColor: ColorConstant.black, textColor: ColorConstant.white)
            ],
          ),
        ),
        backgroundColor: ColorConstant.backgound,
      ),
    );
  }
}