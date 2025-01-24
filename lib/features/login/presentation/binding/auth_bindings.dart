import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/util/http_client.dart';
import '../../data/datasource/auth_datasource.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usecases/login_interactor.dart';
import '../controller/login_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    bindingsController();
  }

  void bindingsController() {

    Get.lazyPut<AuthRemoteDataSource>(() => AuthRemoteDataSource(HttpClient()));

    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepositoryImpl(
      Get.find<AuthRemoteDataSource>(),
      Get.find<SharedPreferences>(),
    ));

    Get.lazyPut<LoginInteractor>(() => LoginInteractor(Get.find<AuthenticationRepository>()));

    Get.lazyPut<AuthController>(() => AuthController(Get.find<LoginInteractor>()));
  }
}
