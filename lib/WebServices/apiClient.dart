import 'dart:convert';

import 'package:flutter_boilerplate/WebServices/apiRequest.dart';
import 'package:flutter_boilerplate/WebServices/apiResponse.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  //
  // Get Request
  static Future<ApiResponse<T>?> getData<T>(
      ApiRequest request, T Function(dynamic) fromJson) async {
    try {
      print("---------------------\n ${request.url}");
      final response = await http.get(request.url, headers: request.headers);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final result = fromJson(jsonResponse);
        // return result;
        return ApiResponse(data: result);
      } else {
        return ApiResponse(error: "HTTP ERROR ${response.statusCode}");
      }
    } catch (e) {
      // throw Exception('Something went wrong $e');
      return ApiResponse(error: e.toString());
    }
  }

  //
  // Post request
  static Future<T?> postData<T>(
      ApiRequest request, dynamic data, T Function(dynamic) fromJson) async {
    try {
      final response = await http.post(
        request.url,
        body: jsonEncode(request.body),
        headers: request.headers,
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final result = fromJson(jsonResponse);
        return result;
      }
    } catch (e) {
      throw Exception('Something went wrong $e');
    }
  }
}
