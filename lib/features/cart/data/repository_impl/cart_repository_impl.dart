import 'package:hive/hive.dart';

import '../../../home/data/model/all_product_model.dart';
import '../../domain/repository/cart_repository.dart';
import '../model/product_image_cache.dart';

class CartRepositoryImpl implements CartRepository {
  static const String boxName = 'cartBox';
  static const String cartKey = 'cartData';

  @override
  Future<CartListHiveModel?> getCartData() async {
    final box = await Hive.openBox<CartListHiveModel>(boxName);
    return box.get(cartKey);
  }

  @override
  Future<void> addProduct(Products product) async {
    final box = await Hive.openBox<CartListHiveModel>('cartBox');

    final existingCartData = box.get('cartData');

    List<CartHiveProducts> cartHiveProducts = [];

    if (existingCartData != null && existingCartData.cartProducts != null) {
      cartHiveProducts = List.from(existingCartData.cartProducts!);
    }

    final existingProductIndex =
        cartHiveProducts.indexWhere((p) => p.id == product.id);

    if (existingProductIndex == -1) {
      CartHiveProducts convertToHiveModel(Products product) {
        return CartHiveProducts(
          id: product.id,
          uid: product.uid,
          title: product.title,
          sku: product.sku,
          weight: product.weight,
          weightUnit: product.weightUnit,
          minimumOrderQuantity: product.minimumOrderQuantity,
          mrp: product.mrp,
          stock: product.stock,
          prouductImages: product.prouductImages?.map((image) {
            return ProductHiveImages(
              id: image.id,
              image: image.image,
            );
          }).toList(),
          promotion: product.promotion != null
              ? PromotionHive(
                  id: product.promotion?.id,
                  createdAt: product.promotion?.createdAt,
                  title: product.promotion?.title,
                  type: product.promotion?.type,
                  description: product.promotion?.description,
                  startDate: product.promotion?.startDate,
                  endDate: product.promotion?.endDate,
                  promotionDetails:
                      product.promotion?.promotionDetails?.map((details) {
                    return PromotionDetailsHive(
                      id: details.id,
                      uid: details.uid,
                      discountType: details.discountType,
                      amount: details.amount,
                      percentage: details.percentage,
                      ruleWeight: details.ruleWeight,
                      minWeight: details.minWeight,
                      maxWeight: details.maxWeight,
                      weightUnit: details.weightUnit,
                      discountProduct: DiscountProductHive(
                        id: details.discountProduct?.id,
                        title: details.discountProduct?.title,
                        freeProductImages:
                            details.discountProduct?.productImages?.map((img) {
                          return FreeProductHiveImages(
                            id: img.id,
                            image: img.image,
                          );
                        }).toList(),
                      ),
                    );
                  }).toList(),
                )
              : null,
          quantitySelected: product.quantitySelected ?? product.minimumOrderQuantity,
        );
      }

      cartHiveProducts.add(convertToHiveModel(product));
    }

    await box.put(
      'cartData',
      CartListHiveModel(
        cartProducts: cartHiveProducts,
        message: 'Cart updated',
      ),
    );
  }

  @override
  Future<void> updateProductQuantity(CartHiveProducts product,
      {required bool isIncrement}) async {
    final box = await Hive.openBox<CartListHiveModel>(boxName);
    final cartData = box.get(cartKey);

    if (cartData != null) {
      var productIndex =
          cartData.cartProducts?.indexWhere((p) => p.id == product.id);
      if (productIndex != -1) {
        var currentQuantity =
            cartData.cartProducts?[productIndex!].quantitySelected ?? 0;
        var incrementBy = product.minimumOrderQuantity ?? 1;
        var maxQuantity = product.minimumOrderQuantity! * product.stock!;

        if (isIncrement) {
          if (currentQuantity + incrementBy <= maxQuantity) {
            cartData.cartProducts?[productIndex!].quantitySelected =
                currentQuantity + incrementBy;
          }
        } else {
          if (currentQuantity - incrementBy >= incrementBy) {
            cartData.cartProducts?[productIndex!].quantitySelected =
                currentQuantity - incrementBy;
          }
        }

        await box.put(cartKey, cartData);
      }
    }
  }

  @override
  Future<void> removeProduct(int productId) async {
    final box = await Hive.openBox<CartListHiveModel>(boxName);
    final cartData = box.get(cartKey);

    if (cartData != null) {
      cartData.cartProducts?.removeWhere((p) =>
          p.id == productId ||
          (p.mrp == 0 && p.title?.startsWith('Free:') == true));
      await box.put(cartKey, cartData);
    }
  }
}
