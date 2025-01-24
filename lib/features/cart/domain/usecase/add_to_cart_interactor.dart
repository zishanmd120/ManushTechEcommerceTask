import '../../../home/data/model/all_product_model.dart';
import '../repository/cart_repository.dart';

class AddToCartInteractor {
  final CartRepository repository;

  AddToCartInteractor(this.repository);

  Future<void> call(Products product) async {
    return await repository.addProduct(product);
  }
}