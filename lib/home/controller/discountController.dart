import 'dart:convert';
import '../../utils/api_endpoint.dart';
import 'package:http/http.dart' as http;
// for dicount banner sections
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
