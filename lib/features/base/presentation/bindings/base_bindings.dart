import 'package:ecom_zishan/features/base/presentation/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseBindings extends Bindings {

  @override
  void dependencies() async {
    await initializeSharedPreferences();
    initializeControllers();
  }

  Future<void> initializeSharedPreferences() async {
    await Get.putAsync(() async => await SharedPreferences.getInstance(), permanent: true);
  }

  void initializeControllers() {
    Get.put<BaseController>(
      BaseController(Get.find<SharedPreferences>()),
    );
  }

}
