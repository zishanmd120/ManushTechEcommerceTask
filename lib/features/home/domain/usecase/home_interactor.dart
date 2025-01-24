import '../../data/model/all_product_model.dart';
import '../repository/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<AllProductModel> call(String title) {
    return repository.getProducts(title);
  }
}
