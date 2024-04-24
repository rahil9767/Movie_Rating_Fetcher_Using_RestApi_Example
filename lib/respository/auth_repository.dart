import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../model/LoginApiResponceModel.dart';
import '../res/app_url.dart';

BaseApiServices _apiServices = NetworkApiService();

class AuthRepository {
  Future<LoginApiResponceModel> loginApiRequestModel(data, {
    required String username,
    required String loginPassword,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(AppUrl.baseUrl));

    request.body = jsonEncode({
      'username': username,
      'password': loginPassword,
    });
    request.headers.addAll(headers);

    if (kDebugMode) {
      print("Body is ${request.body}");
    }

    http.StreamedResponse response = await request.send();
    var jsonResponse = await response.stream.bytesToString();

    if (kDebugMode) {
      print("Status code: ${response.statusCode}");
      print("Response: $jsonResponse");
    }

    if (response.statusCode == 200) {
      var decodedJson = json.decode(jsonResponse);
      return LoginApiResponceModel.fromJson(decodedJson);
    } else {
      throw Exception('Login failed');
    }
  }
}
