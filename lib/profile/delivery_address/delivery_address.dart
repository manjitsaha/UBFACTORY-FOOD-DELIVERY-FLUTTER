import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:newfigma/core/style/style.dart';
import 'package:newfigma/profile/delivery_address/enterAddress.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:newfigma/widgets/iconbutton.dart';
import 'package:newfigma/widgets/maps.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constant/color.dart';

class ProfileDeliveryAddress extends StatefulWidget {
  const ProfileDeliveryAddress({super.key});

  @override
  State<ProfileDeliveryAddress> createState() => _ProfileDeliveryAddressState();
}

class _ProfileDeliveryAddressState extends State<ProfileDeliveryAddress> {
String Address='';
Position? _currentPosition;

Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      GetAddressFromLatLong(_currentPosition!);
      String lat = position.latitude.toString() ;
      String long = position.longitude.toString();
      print(lat + " "+ long);
    }).catchError((e) {
      debugPrint(e);
    });
  }
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      //return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> GetAddressFromLatLong(Position position) async {
List<Placemark> placemark= await placemarkFromCoordinates(position.latitude, position.longitude);
  print(placemark);
  Placemark place = placemark[0];

  Address = '${place.street}'+'${place.name}'+' '+'${place.country}\n${place.postalCode}'+' '+'${place.locality}';
 SharedPreferences address=await SharedPreferences.getInstance();
 address.setString('address',Address);
  setState(() {
    
  });
  }
  void _showBottomSheet(BuildContext context) {
  double width=Get.width;
  showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(12))),

    context: context,
    builder: (BuildContext context) {
      return Container(
        // Content of the bottom sheet
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            IconButtonWidget(onPressed: (){
        Get.to(AddressEntryPage());
            } ,text: 'Enter Manually',backgroundColor: ColorConstant.blue,
            textColor: ColorConstant.white,width:width*0.8 ,
            ),
           SizedBox(height: 20,),
            IconButtonWidget(onPressed: (){
           Get.to(DiscoverMap());
            } ,text: 'Use Current Location',backgroundColor: ColorConstant.white,
            textColor: ColorConstant.blue,width:width*0.8 ,
            ),
            SizedBox(height: 30,)
            ],
          ),
        ),
      );
    },
  );
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    double width=Get.width;
    double height=Get.height;
    
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        title: Text('Delivery Address',style: TextStyle(color: ColorConstant.black),),
        backgroundColor: ColorConstant.white,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Default Address',style: Style.normal1,),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.navigation_outlined),
              SizedBox(width: 8,),
              Text(Address,style: Style.normal,)
            ],
          ),
         SizedBox(height: 70,),
         IconButtonWidget(onPressed: (){
         _showBottomSheet(context);
         }, text: '+  Add new Address', border: Border.all(color: ColorConstant.blue),textColor: ColorConstant.blue,
         width: width*0.9,
         height: height*0.07,
         )
         ],
        ),
      ),
    backgroundColor: ColorConstant.white,
    );
  }
}