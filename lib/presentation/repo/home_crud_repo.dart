
import 'dart:convert';

import '../../core/network/network_api_services.dart';

class HomeCrudRepo {
  final _apiService = NetworkApiServices();

  Future<dynamic> geUserInfoReposApi() async {
    String endpoint = 'userFetch';

    Map<String, String> headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };

    dynamic response = await _apiService.get(
      endpoint, headers: headers
    );
    return response;
  }

  Future<dynamic> createUserInfoReposApi(var data) async {
    String endpoint = 'userInfo';

    Map<String, String> headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    String body = jsonEncode(data);

    dynamic response = await _apiService.post(
        endpoint, headers: headers,
        body: body
    );
    return response;
  }


}