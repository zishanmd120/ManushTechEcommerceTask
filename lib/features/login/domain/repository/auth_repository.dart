import '../../../base/util/http_client.dart';
import '../../data/model/login_response_model.dart';

abstract class AuthenticationRepository {
  Future<NetworkResponse<LoginResponse>> login(
      String identifier, String password);

  String getToken();

  String getUserName();

  String getUserPhone();
}
