import 'dart:io';

import '../../../base/data_state/data_state.dart';
import '../../data/model/login_response_model.dart';
import '../model/login_state_model.dart';
import '../repository/auth_repository.dart';

class LoginInteractor {
  final AuthenticationRepository _authenticationRepository;

  LoginInteractor(this._authenticationRepository);

  Future<LoginStateModel<LoginResponse>> login(String identifier, String password) async {
    if (identifier.isEmpty) {
      return LoginStateModel(null, "Identifier cannot be empty", DataState.validationError);
    }

    if (password.isEmpty) {
      return LoginStateModel(null, "Password cannot be empty", DataState.validationError);
    }

    final response = await _authenticationRepository.login(identifier, password);
    if (response.status == HttpStatus.ok) {
      return LoginStateModel(response.data, "Login successful", DataState.success);
    }

    return LoginStateModel(null, response.message, DataState.failed);
  }

  String getStoredToken() {
    return _authenticationRepository.getToken();
  }
}
