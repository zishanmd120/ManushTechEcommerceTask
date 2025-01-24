import 'package:ecom_zishan/main/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../base/data_state/data_state.dart';
import '../../domain/usecases/login_interactor.dart';

class AuthController extends GetxController {
  final LoginInteractor _loginInteractor;

  var isAuthenticating = false.obs;
  var identifier = ''.obs;
  var password = ''.obs;

  TextEditingController identifierEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  RxBool showPassword = true.obs;

  AuthController(this._loginInteractor);

  void authenticate() async {
    identifier.value = identifierEditingController.text;
    password.value = passwordEditingController.text;

    if (identifier.isEmpty || password.isEmpty) {
      Get.snackbar("Validation Error", "Identifier and password cannot be empty!");
      return;
    }

    if (identifier.value.length < 11) {
      Get.snackbar("Identifier Error", "Identifier too short or Invalid.");
      return;
    }

    isAuthenticating.value = true;

    // 01711355057 manush@456
    final response = await _loginInteractor.login(identifierEditingController.text, passwordEditingController.text);

    isAuthenticating.value = false;

    if (response.state == DataState.success) {
      Get.snackbar("Authentication Success", response.message!);
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar("Authentication Failed", response.message!);
    }
  }

}
