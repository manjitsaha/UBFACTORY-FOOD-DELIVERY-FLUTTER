import 'dart:convert';

import '../../utils/api_endpoint.dart';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> bestselling() async {
   List<Map<String, dynamic>> bestData = [];
  try {
    var url = Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.bestSelling,
    );
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      if (responseData is List) {
        List<Map<String, dynamic>> productList = List.from(responseData);
        for (var item in productList) {
          // print(item);
          String imageUrl = item['fileUrl'] ?? '';
          String id = item['_id'] ?? '';
          String name=item['name']?? '';
          String description=item['description'] ?? '';
          // String sizeId = item['prices']['sizeId'] ?? '';
          List<dynamic> prices = item['prices'] ?? [];
          String price = '';
          String promoprice='';
          String sizeName = '';
          String sizeId='';
          if (prices.isNotEmpty) {
            promoprice=prices[0]['promoPrice'].toString();
            price = prices[0]['price'].toString();
            sizeName = prices[0]['sizeName'] ?? '';
            sizeId = prices[0]['sizeId'] ?? '';
          }
          bestData.add({
           'fileUrl': imageUrl,
           'id': id,
           'name':name,
           'description':description,
           'price': price,
           'sizeName':sizeName,
           'promoPrice':promoprice,
           'sizeId': sizeId
           });
          print('Image URL: $imageUrl');
          print('best selling ID: $id');
          print('name: $name');
          print('description : $description');
          print('sizeName: $sizeName');
          print('price: $price');
          print('promoPrice::: $promoprice');
          print('best selling sizeId id $sizeId');
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
 return bestData;
}
