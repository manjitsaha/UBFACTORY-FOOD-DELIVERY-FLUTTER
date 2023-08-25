import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api_endpoint.dart';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> getproduct() async {
   List<Map<String, dynamic>> productData = [];
  try {
    SharedPreferences id =await SharedPreferences.getInstance();
    var userId = id.getString('_id');
    var url = Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getProduct,
    );
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      if (responseData is List) {
        List<Map<String, dynamic>> productList = List.from(responseData);
        for (var item in productList) {
          
          String imageUrl = item['fileUrl'] ?? '';
          String id = item['_id'] ?? '';
          String name=item['name']?? '';
          String description=item['description'] ?? '';

          List<dynamic> prices = item['prices'] ?? [];
          String price = '';
          String sizeName = '';
          String sizeId='';
          String promoPrice='';

          if (prices.isNotEmpty) {
            price = prices[0]['price'].toString();
            sizeName = prices[0]['sizeName'] ?? '';
            sizeId = prices[0]['sizeId'] ?? '';
            promoPrice = prices[0]['promoPrice'] ?? '';
          }
          productData.add({
           'fileUrl': imageUrl,
           'id': id,
           'name':name,
           'description':description,
           'price': price,
           'sizeName':sizeName,
           'sizeId': sizeId,
            'promoPrice':promoPrice
           });
          print('Image URL: $imageUrl');
          print('ID: $id');
          print('name: $name');
          print('description : $description');
          print('sizeName: $sizeName');
          print('price: $price');
          print('heelo cat id : $sizeId');
          print('hello promo price $promoPrice');
        }
      } else if (responseData is Map) {
        
        Map<String, dynamic> dataMap = Map.from(responseData);
        print(dataMap);
      }
    } else {
      print(response.body);
    }
  } catch (e) {
    print(e.toString());
  }
 return productData;
}
