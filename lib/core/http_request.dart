import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// dev
const String domain = 'http://api.aviationstack.com/v1/';
const String accessKey = "983de15e43fd53941f1554d90d1fabf0";

class HTTPRequest {
  static final _dio = Dio();

  static Future get(String route) async {
    try {
      final response = await _dio.get(
        '$domain$route?access_key=$accessKey',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
      return response;
    } catch (e) {
      print("Dio Error [Route: $route] [Error: $e]");
      rethrow;
    }
  }

  static Future post(String route, {dynamic body}) async {
    try {
      final response = await _dio.post(
        '$domain$route',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: body == null ? null : json.encode(body),
      );
      return response;
    } catch (e) {
      print("Dio Error [Route: $route] [Error: $e]");
      rethrow;
    }
  }

  static Future request(String route, {dynamic body}) async {
    try {
      final response = await _dio.request(
        '$domain$route',
        options: Options(
          method: 'POST',
          headers: {
            // "Authorization": "Bearer $idToken",
            "Content-Type": "multipart/form-data",
          },
        ),
        data: body,
      );
      return response;
    } catch (e) {
      debugPrint("Dio Error [Route: $route] [Error: $e]");
      rethrow;
    }
  }

  static Future update(String route, {dynamic body = const {}}) async {
    try {
      final response = await _dio.patch(
        '$domain$route',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: json.encode(body),
      );
      return response;
    } catch (e) {
      debugPrint("Dio Error [Route: $route] [Error: $e]");
      rethrow;
    }
  }

  static Future delete(String route, {dynamic body}) async {
    try {
      final response = await _dio.delete(
        '$domain$route',
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: body == null ? null : json.encode(body),
      );
      return response;
    } catch (e) {
      debugPrint("Dio Error [Route: $route] [Error: $e]");
      rethrow;
    }
  }
}
