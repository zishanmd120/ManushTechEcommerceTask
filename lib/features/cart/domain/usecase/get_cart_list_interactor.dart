import '../../data/model/product_image_cache.dart';
import '../repository/cart_repository.dart';

class GetCartListInteractor {
  final CartRepository repository;

  GetCartListInteractor(this.repository);

  Future<CartListHiveModel?> call() async {
    return await repository.getCartData();
  }
}