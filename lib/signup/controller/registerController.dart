import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newfigma/home/hometab.dart';
import 'package:newfigma/login/login.dart';
import '../../utils/api_endpoint.dart';

class RegistrationController extends GetxController{
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController username=TextEditingController();


 Future<void> registerUser() async{
  try{
    var headers={'Content-Type':'application/json'};
    var url= Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerUser
    );
    Map body ={
    'name': name.text,
    'email':email.text.trim(),
    'password':password.text,
    'mobile':mobile.text,
    'username': username.text
    };

    http.Response response= 
    await http.post(url,body: jsonEncode(body),headers: headers);
  print('Response Status Code: ${response.statusCode}');
print('Response Body: ${response.body}');
  if(response.statusCode == 201){
    showDialog(context: Get.context!, builder: (context){
      return const SimpleDialog(
        title: Text('Successful'),
        contentPadding: EdgeInsets.all(20),
        children: [Text('User Registered Succefully')]
      );
    }); Get.to(TabHome());
    print(response.body);
    
  }
  else if(response.statusCode== 400){
      showDialog(context: Get.context!, builder: (context){
      return const SimpleDialog(
        title: Text('Note'),
        contentPadding: EdgeInsets.all(20),
        children: [Text('This Mobile Number is already exists. Please Login or use different number to register')]
      );
    }).then((value) => Get.to(LogIn()));
    print(response.statusCode);
    print(response.body);
    }
  
  }
   catch (e) {
    Get.back();
    showDialog(context: Get.context!, builder: (context){
      return SimpleDialog(
        title: const Text('Note'),
        contentPadding: const EdgeInsets.all(20),
        children: [Text(e.toString())],
      );
    });
   }
 }

}