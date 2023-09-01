import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newfigma/profile/order/OrderDeatils.dart';
import 'package:newfigma/widgets/boxTextfield.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:newfigma/widgets/iconbutton.dart';

import '../../core/constant/color.dart';
import '../../search/filterModel.dart';

class ProfileOrder extends StatefulWidget {
  const ProfileOrder({super.key});

  @override
  State<ProfileOrder> createState() => _ProfileOrderState();
}

class _ProfileOrderState extends State<ProfileOrder> {
  FilterOptions selectedFilters = FilterOptions();
  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26), topRight: Radius.circular(26))),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(26),
                      topLeft: Radius.circular(26))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      'Filters',
                      style: TextStyle(fontSize: 18),
                    )),
                    CheckboxListTile(
                      title: Text('Current Orders'),
                      contentPadding: EdgeInsets.all(0),
                      value: selectedFilters.isFeatured,
                      onChanged: (value) {
                        setState(() {
                          selectedFilters.isFeatured = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Completed Orders'),
                      contentPadding: EdgeInsets.all(0),
                      value: selectedFilters.isOnSale,
                      onChanged: (value) {
                        setState(() {
                          selectedFilters.isOnSale = value!;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonWidget(
                          border: BorderSide(color: ColorConstant.blue),
                          width: Get.width * 0.35,
                          height: Get.height * 0.05,
                          onPressed: () {
                            setState(() {
                              selectedFilters.reset();
                            });
                            Navigator.pop(context);
                          },
                          backgroundColor: Colors.white,
                          text: 'Cancel',
                          textColor: ColorConstant.blue,
                        ),
                        ButtonWidget(
                          border: BorderSide(color: ColorConstant.blue),
                          width: Get.width * 0.35,
                          height: Get.height * 0.05,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          backgroundColor: Colors.white,
                          text: 'Apply',
                          textColor: ColorConstant.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(
          color: ColorConstant.black,
        ),
        title: Text(
          'My Orders',
          style: TextStyle(color: ColorConstant.black),
        ),
        backgroundColor: ColorConstant.white,
        elevation: 2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BoxTextField(
                    hint: 'Search your order here',
                    borderRadius: 8,
                    width: width * 0.65,
                  ),
                  IconButtonWidget(
                    onPressed: () {
                      _showFilterBottomSheet(context);
                    },
                    text: 'Filter',
                    backgroundColor: ColorConstant.white,
                    textColor: ColorConstant.black,
                    width: width * 0.26,
                    prefixIcon: Icons.filter_list,
                    prefixIconColor: ColorConstant.black,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(OrderDetailsScreen());
                },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image(image: AssetImage('assets/images/home2.png')),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delivered on Mon Aug 28',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Dosa Batter',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.textGrey)),
                          SizedBox(
                            height: 8,
                          ),
                          Image(image: AssetImage('assets/images/stars.png')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Rate this product now',
                            style: TextStyle(color: ColorConstant.textGrey),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                           Get.to(OrderDetailsScreen());
                          }, icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(OrderDetailsScreen());
                 },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/images/home2.png')),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delivered on Aug 2',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Fry Pooris',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.textGrey)),
                          SizedBox(
                            height: 8,
                          ),
                          Image(image: AssetImage('assets/images/stars.png')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Rate this product now',
                            style: TextStyle(color: ColorConstant.textGrey),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.to(OrderDetailsScreen());
                          }, icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                 Get.to(OrderDetailsScreen()); 
                 },
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/images/home2.png')),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delivered on Jul 28',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Pasta',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.textGrey)),
                          SizedBox(
                            height: 8,
                          ),
                          Image(image: AssetImage('assets/images/stars.png')),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Rate this product now',
                            style: TextStyle(color: ColorConstant.textGrey),
                          )
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                             Get.to(OrderDetailsScreen());
                         },
                          icon: Icon(Icons.arrow_forward_ios))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: ColorConstant.white,
    );
  }
}

