import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpClient {
  Future<NetworkResponse> post({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        body: jsonEncode(body),
        headers: headers,
      );
      return NetworkResponse(
        status: response.statusCode,
        message: response.body,
        data: jsonDecode(response.body),
      );
    } catch (e) {
      return NetworkResponse.withFailure("Error occurred", HttpStatus.internalServerError);
    }
  }
}

class NetworkResponse<T> {
  final int status;
  final String? message;
  final T? data;

  NetworkResponse({required this.status, this.message, this.data});

  static NetworkResponse<T> withSuccess<T>(T data, String? message, [int status = HttpStatus.ok]) {
    return NetworkResponse(status: status, message: message, data: data);
  }

  static NetworkResponse<T> withFailure<T>(String? message, [int status = HttpStatus.internalServerError]) {
    return NetworkResponse(status: status, message: message, data: null);
  }
}
