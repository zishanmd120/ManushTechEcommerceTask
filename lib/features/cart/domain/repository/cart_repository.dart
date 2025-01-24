import 'package:ecom_zishan/features/home/data/model/all_product_model.dart';

import '../../data/model/product_image_cache.dart';

abstract class CartRepository {

  Future<CartListHiveModel?> getCartData();

  Future<void> addProduct(Products product);

  Future<void> updateProductQuantity(CartHiveProducts product, {required bool isIncrement});

  Future<void> removeProduct(int productId);
}