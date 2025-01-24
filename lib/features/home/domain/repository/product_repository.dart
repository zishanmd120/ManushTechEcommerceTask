import '../../data/model/all_product_model.dart';

abstract class ProductRepository {
  Future<AllProductModel> getProducts(String title);
}
