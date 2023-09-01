import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/response/status.dart';
import '../../utils/api_endpoint.dart';

class HomeController extends GetxController{
  final rxRequestStatus = Status.LOADING.obs;
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
 //categoryController
 Future<List<Map<String, dynamic>>> getcategory() async {
   List<Map<String, dynamic>> categoryData = [];
  try {
    var url = Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.category,
    );
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      if (responseData is List) {
        List<Map<String, dynamic>> productList = List.from(responseData);
        for (var item in productList) {
          // print(item);
          String imageUrl = item['imageUrl'] ?? '';
          String id = item['_id'] ?? '';
          String name=item['name']?? '';
          
          categoryData.add({
           'imageUrl': imageUrl,
           'id': id,
           'name':name,
           
           });
          print('Image URL: $imageUrl');
          print('ID: $id');
          print('name: $name');
         
        }
      } else if (responseData is Map) {
        // Handle the case where the response is a map
        Map<String, dynamic> dataMap = Map.from(responseData);
        print(dataMap);
      }
    } else {
      print(response.body);
    }
  } catch (e) {
    print(e.toString());
  }
 return categoryData;
}
//discount Controller
Future<List<Map<String, dynamic>>> discount() async {
   List<Map<String, dynamic>> extractedData = [];
  try {
    var url = Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getDiscount,
    );
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      if (responseData is List) {
        // Handle the case where the response is a list
        List<Map<String, dynamic>> dataList = List.from(responseData);
        for (var item in dataList) {
          // print(item);
          String imageUrl = item['imageUrl'];
          String id = item['_id'];
          extractedData.add({'imageUrl': imageUrl, 'id': id});
          print('Image URL: $imageUrl');
          print('ID: $id');
        }
      } else if (responseData is Map) {
        // Handle the case where the response is a map
        Map<String, dynamic> dataMap = Map.from(responseData);
        print(dataMap);
      }
    } else {
      print(response.body);
    }
  } catch (e) {
    print(e.toString());
  }
 return extractedData;
}
//product Controller
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

}