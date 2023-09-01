// import 'dart:convert';

// import '../../utils/api_endpoint.dart';
// import 'package:http/http.dart' as http;
// //for grocieries section
// Future<List<Map<String, dynamic>>> getcategory() async {
//    List<Map<String, dynamic>> categoryData = [];
//   try {
//     var url = Uri.parse(
//       ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.category,
//     );
//     http.Response response = await http.get(url);
//     if (response.statusCode == 200) {
//       final dynamic responseData = json.decode(response.body);
//       if (responseData is List) {
//         List<Map<String, dynamic>> productList = List.from(responseData);
//         for (var item in productList) {
//           // print(item);
//           String imageUrl = item['imageUrl'] ?? '';
//           String id = item['_id'] ?? '';
//           String name=item['name']?? '';
          
//           categoryData.add({
//            'imageUrl': imageUrl,
//            'id': id,
//            'name':name,
           
//            });
//           print('Image URL: $imageUrl');
//           print('ID: $id');
//           print('name: $name');
         
//         }
//       } else if (responseData is Map) {
//         // Handle the case where the response is a map
//         Map<String, dynamic> dataMap = Map.from(responseData);
//         print(dataMap);
//       }
//     } else {
//       print(response.body);
//     }
//   } catch (e) {
//     print(e.toString());
//   }
//  return categoryData;
// }
