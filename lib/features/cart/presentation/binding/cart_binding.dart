import 'package:ecom_zishan/features/cart/data/repository_impl/cart_repository_impl.dart';
import 'package:ecom_zishan/features/cart/domain/repository/cart_repository.dart';
import 'package:ecom_zishan/features/cart/domain/usecase/get_cart_list_interactor.dart';
import 'package:ecom_zishan/features/cart/domain/usecase/update_product_quantity_intercator.dart';
import 'package:ecom_zishan/features/cart/presentation/controller/cart_controller.dart';
import 'package:get/get.dart';

import '../../domain/usecase/add_to_cart_interactor.dart';
import '../../domain/usecase/remove_cart_interactor.dart';

class CartBindings extends Bindings{

  @override
  void dependencies() {
    bindingsController();
  }

  bindingsController(){
    Get.lazyPut<GetCartListInteractor>(() => GetCartListInteractor(Get.find()));
    Get.lazyPut<UpdateProductQuantityIntercator>(() => UpdateProductQuantityIntercator(Get.find()));
    Get.lazyPut<RemoveCartIntercator>(() => RemoveCartIntercator(Get.find()));
    Get.lazyPut<AddToCartInteractor>(() => AddToCartInteractor(Get.find()));
    Get.lazyPut<CartRepository>(() => CartRepositoryImpl());
    Get.lazyPut<CartController>(() => CartController(
      Get.find<GetCartListInteractor>(),
      Get.find<UpdateProductQuantityIntercator>(),
      Get.find<RemoveCartIntercator>(),
    ));
  }
}