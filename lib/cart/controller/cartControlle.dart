import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/api_endpoint.dart';
import '../model/cart_model.dart';

class CartController extends GetxController {
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;
 
  var cartModel = CartModel();

  Future<CartModel> getCart() async{
    SharedPreferences token = await SharedPreferences.getInstance();
      var userId = token.getString('newtoken');
    var headers={
      'Content-Type':'application/json',
      'Authorization': 'Bearer $userId',
      };
    var url= Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getCart
    );
    http.Response response= await http.get(
      url,
      headers: headers
    );

    print(response.body);
    
    return CartModel.fromJson(jsonDecode(response.body));
  }

  Future<void> addToCart(String productId, String sizeId, int quantity) async {
    try {
      SharedPreferences token = await SharedPreferences.getInstance();
      var userId = token.getString('newtoken');
      
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.addToCart);
      var headers = {
        'Authorization': 'Bearer $userId',
        'Content-Type': 'application/json',
      };

      var body = {
        'productId': productId,
        'sizeId': sizeId,
        'quantity': quantity,
      };

      http.Response response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        final snackBar = SnackBar(
        content: Text('Item added to cart'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
       cartItems.add(body); 
        print(response.body);
        print(cartItems);
      } else {
         final snackBar = SnackBar(
        content: Text('failed to add to cart'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
      
        print('Failed to add item to cart');
      }
    } catch (e) {
      print('Error adding item to cart: $e');
    }
  }

}

