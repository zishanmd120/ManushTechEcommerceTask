import '../repository/cart_repository.dart';

class RemoveCartIntercator {
  final CartRepository repository;

  RemoveCartIntercator(this.repository);

  Future<void> call(int productId) async {
    return await repository.removeProduct(productId);
  }
}