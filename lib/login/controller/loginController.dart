import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newfigma/home/hometab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/response/status.dart';
import '../../utils/api_endpoint.dart';

class LoginController extends TextEditingController{
final RxBool isLoading = false.obs;
final rxRequestStatus = Status.LOADING.obs;
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
  print(response.body);
// print('Response Body: ${response.body}');
  if(response.statusCode == 200){
    final data = jsonDecode(response.body);
    final token = data['token']??'';
    final username=data['customer']['name']??'';
    final useremail=data['customer']['email']??'';
   
    
    SharedPreferences passtoken =await SharedPreferences.getInstance();
    passtoken.setString('newtoken', token);
    passtoken.setString('username',username);
    passtoken.setString('useremail', useremail);
    String uname= passtoken.getString('username')??'';
    String uemail= passtoken.getString('useremail')??'';
    print(uname);
    print(uemail);
    print(token);
    // showDialog(
    //   context: Get.context!,
    //   builder: (context){
    //   final dialog = SimpleDialog(
    //     title: Text('Successful'),
    //     contentPadding: EdgeInsets.all(20),
    //     children: [Text('User Logged In Succefully')]
    //   );
    //   Future.delayed(Duration(seconds: ), () {
    //   Navigator.of(context).pop(); 
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => TabHome()),
    //   );
    // });
    // return dialog;
    // }
    // ).then((value) => Get.to(TabHome()));
    Get.to(TabHome());
    final json =jsonDecode(response.body);
    if(json['code']==0){
      var token =json['data']['Token'];
      print('token is just like token =='+ token);
      // final SharedPreferences prefs= await _prefs;
      SharedPreferences passtoken =await SharedPreferences.getInstance();
      passtoken.setString('newtoken', token);
     
    }
    
  }
  else if(response.statusCode== 401){
      showDialog(context: Get.context!, builder: (context){
      return const SimpleDialog(
        title: Text('Note'),
        contentPadding: EdgeInsets.all(20),
        children: [Text('User is not Registered. Please Register.')]
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
