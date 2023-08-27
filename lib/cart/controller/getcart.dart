import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../utils/api_endpoint.dart';

class GetCartController extends GetxController {
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  Future<void> fetchCartItems() async {
    try {
      SharedPreferences token = await SharedPreferences.getInstance();
      var userId = token.getString('newtoken');

      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getCart);
      var headers = {
        'Authorization': 'Bearer $userId',
      };

      http.Response response = await http.get(
        url,
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> items = json.decode(response.body);
        final List<Map<String, dynamic>> cartItemsList =
            List<Map<String, dynamic>>.from(items); 
        cartItems.assignAll(cartItemsList); 
        print('successfully added item in items');
        
      } else {
        print('Failed to fetch cart items');
      }
    } catch (e) {
      print('Error fetching cart items: $e');
    }
  }
}
