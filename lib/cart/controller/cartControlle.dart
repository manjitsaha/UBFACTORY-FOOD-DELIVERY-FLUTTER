import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../utils/api_endpoint.dart';

class CartController extends GetxController {
   RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  void getaddToCart(Map<String, dynamic> item) {
    cartItems.add(item);
    update();
  }

Future<void> addToCart(String productId, String sizeId, int quantity) async {
  try {
    SharedPreferences token = await SharedPreferences.getInstance();
    var userId = token.getString('newtoken');
    print(userId);

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

    print('cart - ${response.body}');
    if (response.statusCode == 200) {

      print('Item added to cart');
      
    } else {
      print('Failed to add item to cart');
    }
  } catch (e) {
    print('Error adding item to cart: $e');
  }
}

}



