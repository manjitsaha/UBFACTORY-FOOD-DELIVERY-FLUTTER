// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class OTPService {
//  String mobileNumber ='';

//    Future<bool> sendOTP(String mobileNumber) async {
//     String apiUrl = 'https://webient.in/api/auth/send-otp';
    
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         body: {'mobile_number': mobileNumber},
//       );

//       if (response.statusCode == 200) {
//         print('OtP Sent ');
//     return true;
//       } 
//       else if(response.statusCode==409){
//         showDialog(context: Get.context!, builder: (context){
//       return const SimpleDialog(
//         title: Text('Note'),
//         contentPadding: EdgeInsets.all(20),
//         children: [Text('Number is Not Registered With Us')],
//       );
//     });
//     return false;
//       }
//       else  {
//         return false;
//       }
//     } catch (error) {
//       print('Error sending OTP: $error');
//       showDialog(context: Get.context!, builder: (context){
//       return const SimpleDialog(
//         title: Text('Note'),
//         contentPadding: EdgeInsets.all(20),
//         children: [Text('Error Try Again Later')],
//       );
//     });
//       return false;
//     }
//   }

//   static Future<bool> verifyOTP(String mobileNumber, String enteredOTP) async {
//     String apiUrl = 'https://webient.in/api/auth/customer-login';

//    try {
//       var data = {
//           "mobile_number": mobileNumber,
//           "otp": enteredOTP,
//         };
//         print(data);
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         body: data,
//       );
// print(response.body);
//       if (response.statusCode == 200) {
//         Map<String, dynamic>jsonResponse =json.decode(response.body);
//         if(jsonResponse.containsKey('token')){
//           String accessToken =jsonResponse['token']['original']['access_token'];
//           String user=jsonResponse['token']['original']['cutomer']['name'];
//           print('Acess token is : $accessToken');
//         }
//         return true;
//       } else {
//         return false;
//       }
//     } catch (error) {
//       print('Error verifying OTP: $error');
//       return false;
//     }
//   }
// }
