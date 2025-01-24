import 'dart:async';

import 'package:ecom_zishan/features/cart/domain/usecase/add_to_cart_interactor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../cart/data/model/product_image_cache.dart';
import '../../../cart/domain/usecase/get_cart_list_interactor.dart';
import '../../../login/domain/usecases/user_data_interactor.dart';
import '../../data/model/all_product_model.dart';
import '../../domain/usecase/home_interactor.dart';

class HomeController extends GetxController {
  final GetProductsUseCase getProductsUseCase;
  final AddToCartInteractor addToCartInteractor;
  final GetCartListInteractor getCartListInteractor;
  final UserDataInteractor userDataInteractor;

  HomeController(this.getProductsUseCase, this.addToCartInteractor, this.getCartListInteractor, this.userDataInteractor);

  Data ? data;
  var productList = [];
  var isLoading = false.obs;

  Timer? _debounce;

  TextEditingController searchEditingController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  CartListHiveModel ? cartListHiveModel;

  @override
  void onInit() {
    super.onInit();
    fetchProducts("");
    getCartProductList();
  }

  void fetchProducts(String title) async {
    isLoading.value = true;
    try {
      final products = await getProductsUseCase(title);
      productList = products.data?.products ?? [];
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 500), () {
      fetchProducts(value);
    });
  }

  var isGettingCartData = false.obs;
  getCartProductList() async{
    isGettingCartData.value = true;
    var response = await getCartListInteractor.call();
    if(response != null){
      cartListHiveModel = response;
      isGettingCartData.value = false;
    }
    isGettingCartData.value = false;
  }

  var quantity = 0.obs;
  var discount = 0.obs;
  var existingQuantity = 0.obs;
  var existingQuantityUpdating = false.obs;
  TextEditingController quantityEditingController = TextEditingController();
  FocusNode quantityFocusNode = FocusNode();

  initialQuantitySet(Products product){
    quantity.value = product.minimumOrderQuantity ?? 0;
    quantityEditingController = TextEditingController(
      text: quantity.value.toString(),
    );
    discount.value = calculateDiscount(product, quantity.value).toInt();
  }

  addToCartProduct(Products product){
    isLoading.value = true;
    addToCartInteractor.call(product);
    getCartProductList();
    isLoading.value = false;
  }

  void incrementQuantity(Products product) {
    var incrementBy = product.minimumOrderQuantity ?? 1;
    var maxQuantity = product.minimumOrderQuantity! * product.stock!;
    if (quantity.value + incrementBy <= maxQuantity) {
      quantity.value += incrementBy;
      product.quantitySelected = quantity.value;
      quantityEditingController.text = quantity.value.toString();
      discount.value = calculateDiscount(product, quantity.value).toInt();
    }
  }

  void decrementQuantity(Products product) {
    var incrementBy = product.minimumOrderQuantity ?? 1;
    if (quantity.value - incrementBy >= incrementBy) {
      quantity.value -= incrementBy;
      product.quantitySelected = quantity.value;
      quantityEditingController.text = quantity.value.toString();
      discount.value = calculateDiscount(product, quantity.value).toInt();
    }
  }

  void updateQuantity(Products product, String value) {
    var incrementBy = product.minimumOrderQuantity ?? 1;
    var maxQuantity = (product.minimumOrderQuantity ?? 1) * (product.stock ?? 0);

    final int? newQuantity = int.tryParse(value);

    if (newQuantity == null || newQuantity < incrementBy) {
      quantity.value = incrementBy;
      quantityEditingController.text = incrementBy.toString();
      discount.value = calculateDiscount(product, quantity.value).toInt();
    } else if (newQuantity > maxQuantity) {
      quantity.value = maxQuantity;
      quantityEditingController.text = maxQuantity.toString();
      discount.value = calculateDiscount(product, quantity.value).toInt();
    } else {
      quantity.value = newQuantity;
      discount.value = calculateDiscount(product, quantity.value).toInt();
    }

    product.quantitySelected = quantity.value;
    discount.value = calculateDiscount(product, quantity.value).toInt();
  }

  num calculateDiscount(Products product, int quantity) {
    if (product.promotion == null || product.promotion!.promotionDetails == null) return 0.0;

    final promotionDetails = product.promotion!.promotionDetails!;
    if (product.promotion!.type == 'WEIGHT') {
      final totalWeight = quantity * product.weight;
      for (var detail in promotionDetails) {
        if (totalWeight >= (detail.minWeight ?? 0) &&
            (detail.maxWeight == null || totalWeight <= detail.maxWeight!)) {
          return (totalWeight / (detail.ruleWeight ?? 0)).floor() * (detail.amount ?? 0);
        }
      }
    }
    return 0.0;
  }

}
