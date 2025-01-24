import '../../domain/repository/product_repository.dart';
import '../datasource/product_datasource.dart';
import '../model/all_product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AllProductModel> getProducts(String title) async {
    final productModels = await remoteDataSource.fetchProducts(title);
    return productModels;
  }
}