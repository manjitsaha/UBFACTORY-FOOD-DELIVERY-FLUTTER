import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newfigma/core/constant/color.dart';
import 'package:newfigma/home/hometab.dart';
import 'package:newfigma/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/api_endpoint.dart';

class LoginController extends TextEditingController{
final RxBool isLoading = false.obs;
  TextEditingController password=TextEditingController();
  TextEditingController email=TextEditingController();

  Future<void> loginUser()async {
  
  try{
    
    var headers={'Content-Type':'application/json'};
    var url= Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginUser
    );
    Map body ={
    'email': email.text,
    'password':password.text
    };

    http.Response response= 
    await http.post(url,body: jsonEncode(body),headers: headers);
  print('Response Status Code: ${response.statusCode}');
// print('Response Body: ${response.body}');
  if(response.statusCode == 200){
    final data = jsonDecode(response.body);
    final token = data['token']??'';
    SharedPreferences passtoken =await SharedPreferences.getInstance();
    passtoken.setString('newtoken', token);
    print(token);
    showDialog(context: Get.context!, builder: (context){
      return const SimpleDialog(
        title: Text('Successful'),
        contentPadding: EdgeInsets.all(20),
        children: [Text('User Logged In Succefully')]
      );
    }).then((value) => Get.to(TabHome())
    //  showDialog(context:Get.context!, builder: (context){
    //   return SimpleDialog(
    //     title: Text('Permission'),
    //     contentPadding: EdgeInsets.all(20),
    //     children: [Text('Allow Location Access for better Results.'),
    //     SizedBox(height: 10,),
    //     ButtonWidget(onPressed: () {
    //       Get.to(TabHome());
    //     }
         
    //     , text: 'Grant Permission', backgroundColor: ColorConstant.buttonbackgound, textColor: ColorConstant.white)
    //     ]
    //   );
    //  })
    );
    final json =jsonDecode(response.body);
    if(json['code']==0){
      var token =json['data']['Token'];
      print('token is just like token =='+ token);
      // final SharedPreferences prefs= await _prefs;
      SharedPreferences passtoken =await SharedPreferences.getInstance();
      passtoken.setString('newtoken', token);
     
    }
    
  }
  else if(response.statusCode== 400){
      showDialog(context: Get.context!, builder: (context){
      return const SimpleDialog(
        title: Text('Note'),
        contentPadding: EdgeInsets.all(20),
        children: [Text('This Mobile Number is already exists. Please Login or use different number to register')]
      );
    });
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
