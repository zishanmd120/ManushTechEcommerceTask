import 'package:ecom_zishan/features/cart/domain/usecase/remove_cart_interactor.dart';
import 'package:ecom_zishan/features/cart/domain/usecase/update_product_quantity_intercator.dart';
import 'package:get/get.dart';

import '../../data/model/product_image_cache.dart';
import '../../domain/usecase/get_cart_list_interactor.dart';

class CartController extends GetxController {
  final GetCartListInteractor getCartData;
  final UpdateProductQuantityIntercator updateProductQuantityIntercator;
  final RemoveCartIntercator removeCartIntercator;

  CartController(
    this.getCartData,
    this.updateProductQuantityIntercator,
    this.removeCartIntercator,
  );

  RxList<CartHiveProducts> cartProducts = <CartHiveProducts>[].obs;
  RxList<CartHiveProducts> freeProducts = <CartHiveProducts>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCartData();
  }

  Future<void> loadCartData() async {
    final data = await getCartData.call();
    if (data != null) {
      cartProducts.assignAll(data.cartProducts ?? []);
    }
  }

  void incrementQuantity(CartHiveProducts product) async {
    await updateProductQuantityIntercator.call(product, true);
    await loadCartData();
  }

  void decrementQuantity(CartHiveProducts product) async {
    await updateProductQuantityIntercator.call(product, false);
    await loadCartData();
  }

  void removeFromCart(int productId) async {
    await removeCartIntercator.call(productId);
    await loadCartData();
  }
}