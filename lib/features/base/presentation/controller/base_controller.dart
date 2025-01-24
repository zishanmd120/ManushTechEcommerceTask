import 'package:ecom_zishan/main/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BaseController extends GetxController{

  final SharedPreferences sharedPreferences;
  BaseController(this.sharedPreferences);

  @override
  void onInit() {
    super.onInit();
    loadFirstPage();
  }

  loadFirstPage(){
    sharedPreferences.getString('authorization') == null || sharedPreferences.getString('authorization') == ""
        ? Get.offAllNamed(AppRoutes.login)
        : Get.offAllNamed(AppRoutes.dashboard);
  }
}