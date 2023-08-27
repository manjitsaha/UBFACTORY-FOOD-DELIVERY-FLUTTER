import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../errors/app_exception.dart';
import 'base_api.dart';

class NetworkApi extends BaseApi {
  @override
  Future getApi(String url) async {
    print(url);
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    }

    return responseJson;
  }

  @override
  Future getApiBody(String url, int id, String role) async {
    dynamic responseJson;
    var params = {"id": id.toString(), "role": role};
    print(params);
    var uri = Uri.parse(url);
    var uii = uri.replace(queryParameters: params);

    try {
      final response = await http.get(uii);
      responseJson = returnResponse(response);
      print(responseJson);
    } on SocketException {
      throw NoInternetException('');
    }

    return responseJson;
  }

  @override
  Future postApi(String url, dynamic data) async {
    print(url);
    print('man - ${data}');
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    }

    return responseJson;
  }

  @override
  Future putApi(String url, dynamic data) async {
    dynamic responseJson;
    print(url);
    print(data);
    try {
      final response = await http.put(Uri.parse(url),
          body: data, headers: {'Content-Type': 'application/json'});
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    }

    return responseJson;
  }

  @override
  Future deleteApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.delete(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        print('${response.statusCode} : ${response.body}');
        throw FetchDataException(
            '${response.statusCode} : ${response.body}  : Error occured while communicating with server');
    }
  }
}
