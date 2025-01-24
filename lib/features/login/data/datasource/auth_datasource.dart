import 'dart:io';

import 'package:ecom_zishan/features/base/util/end_points.dart';

import '../../../base/util/http_client.dart';
import '../model/login_response_model.dart';

class AuthRemoteDataSource {
  final HttpClient _httpClient;

  AuthRemoteDataSource(this._httpClient);

  Future<NetworkResponse<LoginResponse>> login(String identifier, String password) async {
    final response = await _httpClient.post(
      endpoint: EndPoints.loginUrl,
      body: {"identifier": identifier, "password": password},
      headers: {'Content-Type': 'application/json'},
    );

    if (response.status == HttpStatus.ok) {
      return NetworkResponse.withSuccess(LoginResponse.fromJson(response.data), response.message, response.status);
    }

    return NetworkResponse.withFailure(response.data, response.status);
  }

}
