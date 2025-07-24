import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../app_expection/app_expection.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {

  @override

  Future<dynamic> get(String endpoint, {Map<String, String>? headers, String? imageUrl}) async {
    if (kDebugMode) {
      print(BaseApiServices.baseUrl + endpoint);
    }

    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(BaseApiServices.baseUrl + endpoint), headers: headers);
      responseJson = returnResponse(response, imageUrl);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> post(String endpoint, {Map<String, String>? headers, dynamic body, String? imageUrl}) async {
    if (kDebugMode) {
      print(BaseApiServices.baseUrl + endpoint);
      print(body);
    }
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(BaseApiServices.baseUrl + endpoint), headers: headers, body: body);
      responseJson = returnResponse(response, imageUrl);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> put(String endpoint, {Map<String, String>? headers, dynamic body, String? imageUrl}) async {

    if (kDebugMode) {
      print(BaseApiServices.baseUrl + endpoint);
      print(body);
    }

    dynamic responseJson;
    try {
      final response = await http.put(Uri.parse(BaseApiServices.baseUrl + endpoint), headers: headers, body: body);
      responseJson = returnResponse(response, imageUrl);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> delete(String endpoint,
      {Map<String, String>? headers, String? imageUrl, required String body}) async {

    if (kDebugMode) {
      print(BaseApiServices.baseUrl + endpoint);
    }

    dynamic responseJson;
    try {
      final response = await http.delete(Uri.parse(BaseApiServices.baseUrl + endpoint), headers: headers);
      responseJson = returnResponse(response, imageUrl);
    } on SocketException {
      throw InternetException('');
    } on TimeoutException {
      throw RequestTimeOut('');
    }
    return responseJson;
  }



  dynamic returnResponse(http.Response response, String? imageUrl) {
    print(response.statusCode);
    switch(response.statusCode) {
      case 201:
        dynamic responseJson = jsonDecode(response.body);

        return imageUrl != null ? imageUrl + responseJson : responseJson;

      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return imageUrl != null ? imageUrl + responseJson : responseJson;

      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return imageUrl != null ? imageUrl + responseJson : responseJson;
    // throw ServerException(responseJson);
      default:
        throw FetchDataException('Error occurred while communicating with server: ${response.statusCode}');
    }
  }


}
