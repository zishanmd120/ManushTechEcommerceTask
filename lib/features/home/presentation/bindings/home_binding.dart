import 'package:ecom_zishan/features/home/presentation/controller/home_controller.dart';
import 'package:ecom_zishan/features/login/domain/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/util/http_client.dart';
import '../../../cart/domain/usecase/add_to_cart_interactor.dart';
import '../../../cart/domain/usecase/get_cart_list_interactor.dart';
import '../../../login/data/datasource/auth_datasource.dart';
import '../../../login/data/repository/auth_repository_impl.dart';
import '../../../login/domain/usecases/user_data_interactor.dart';
import '../../data/datasource/product_datasource.dart';
import '../../data/repository/product_repository_impl.dart';
import '../../domain/repository/product_repository.dart';
import '../../domain/usecase/home_interactor.dart';

class HomeBindings extends Bindings{

  @override
  void dependencies() {
    bindingsController();
  }

  bindingsController(){
    Get.lazyPut<GetCartListInteractor>(() => GetCartListInteractor(Get.find()));
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSource(Get.find<SharedPreferences>()));
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl(remoteDataSource: Get.find<RemoteDataSource>()));
    Get.lazyPut<GetProductsUseCase>(() => GetProductsUseCase(Get.find()));
    Get.lazyPut<AddToCartInteractor>(() => AddToCartInteractor(Get.find()));
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepositoryImpl(
      AuthRemoteDataSource(HttpClient()),
      Get.find<SharedPreferences>(),
    ));
    Get.lazyPut<UserDataInteractor>(() => UserDataInteractor(Get.find<AuthenticationRepository>()));
    Get.lazyPut<HomeController>(() => HomeController(
      Get.find<GetProductsUseCase>(),
      Get.find<AddToCartInteractor>(),
      Get.find<GetCartListInteractor>(),
      Get.find<UserDataInteractor>(),
    ),);
  }
}