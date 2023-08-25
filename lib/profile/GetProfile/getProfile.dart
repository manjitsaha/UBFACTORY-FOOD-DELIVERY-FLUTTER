

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _fetchProfileData() async {
   SharedPreferences token= await SharedPreferences.getInstance();
   var newtoken=token.getString('newtoken');

    if (newtoken != null) {
      final response = await http.get(
        Uri.parse(''),
        headers: {'Authorization': 'Bearer $newtoken'},
      );

      if (response.statusCode == 200) {
        print('get sucess');
      }
    else{
      print('fail');
    }
    }
  }