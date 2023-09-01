import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../network/network_api.dart';
import '../../../response/status.dart';
import '../../../utils/api_endpoint.dart';
import '../model/MyDetails_model.dart';

class ProfileController extends GetxController {
 
  var _api = NetworkApi();

  final rxRequestStatus = Status.LOADING.obs;
  final profileModel = GetProfile().obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setCartList(GetProfile value) => profileModel.value = value;

  Future<GetProfile> getDetailProfile() async {
    SharedPreferences token = await SharedPreferences.getInstance();
    var userId = token.getString('newtoken');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userId',
    };
    var url =
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.getProfile);
    var response = await http.get(url, headers: headers);

    print(response.body);

    return GetProfile.fromJson(jsonDecode(response.body));
  }

  void getProfile() {
    getDetailProfile().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setCartList(value);
      // for (var events in transactionModel.value.data!) {
      //   mData.add(events);
      // }
    }).onError((error, stackTrace) {
      print(stackTrace);
      print('--------------------');
      print(error);
      setRxRequestStatus(Status.ERROR);
    });
  }

  }
