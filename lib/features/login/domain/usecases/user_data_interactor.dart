import '../repository/auth_repository.dart';

class UserDataInteractor {
  final AuthenticationRepository _authenticationRepository;

  UserDataInteractor(this._authenticationRepository);

  String getUserName() {
    return _authenticationRepository.getUserName();
  }

  String getUserPhone() {
    return _authenticationRepository.getUserPhone();
  }
}
