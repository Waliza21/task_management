import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkCaller {
  //ei file e http package ke isolate kore felbo. DO is also a famous package

  static Future<NetworkResponse> getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url);

      Response response = await get(uri);
      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(
    String url,
    {Map<String, dynamic>? body,}
  ) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, body: body);

      Response response = await post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      final decodedData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          body: decodedData,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          errorMessage: decodedData['data']
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        responseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static void _logRequest(String url, {Map<String, dynamic>? body}) {
    debugPrint(
      'URL:$url\n'
      'Body: $body',
    );
  }

  static void _logResponse(String url, Response response) {
    debugPrint(
      'URL:$url\n'
      'Status Code:${response.statusCode}\n'
      'Body: ${response.body}',
    );
  }
}

class NetworkResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic body; //nao thakte pare tai dynamic
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.responseCode,
    this.body, //required na as nao thakte pare
    this.errorMessage='Something went wrong', //required na as nao thakte pare
  });
}


//jwt token, access token. 3ta part - header, payload/body, secret.
//local database 2 type er. 1. cache type er database- memory er porer layer, lightweight data rakhi amra cache e, kb size er, 2. persistence database - file drive memory te giye disk e rakhe. 3. Hive/sqlight.
//amra cache use korbo for faster use, shared_preference plugin use korbo.