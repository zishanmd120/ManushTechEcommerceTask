import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/util/http_client.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/auth_datasource.dart';
import '../model/login_response_model.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final SharedPreferences _sharedPreferences;

  AuthenticationRepositoryImpl(this._remoteDataSource, this._sharedPreferences);

  @override
  Future<NetworkResponse<LoginResponse>> login(String identifier, String password) async{
    final response = await _remoteDataSource.login(identifier, password);
    if (response.status == 200) {
      final token = response.data?.data?.token;
      final userName = response.data?.data?.user?.username;
      final userPhone = response.data?.data?.user?.phone;
      if (token != null) {
        await _sharedPreferences.setString('authorization', token);
        await _sharedPreferences.setString('user_name', userName ?? "");
        await _sharedPreferences.setString('user_phone', userPhone ?? "");
      }
    }
    return response;
  }

  @override
  String getToken() {
    return _sharedPreferences.getString('authorization') ?? "";
  }

  @override
  String getUserName() {
    return _sharedPreferences.getString('user_name') ?? "";
  }

  @override
  String getUserPhone() {
    return _sharedPreferences.getString('user_phone') ?? "";
  }

}
