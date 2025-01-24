import '../../data/model/product_image_cache.dart';
import '../repository/cart_repository.dart';

class UpdateProductQuantityIntercator {
  final CartRepository repository;

  UpdateProductQuantityIntercator(this.repository);

  Future<void> call(CartHiveProducts product, bool isIncrement) async {
    return await repository.updateProductQuantity(product, isIncrement: isIncrement);
  }
}