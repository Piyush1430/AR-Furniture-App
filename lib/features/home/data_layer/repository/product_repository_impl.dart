import 'package:new_app/core/error/exceptions.dart';
import 'package:new_app/features/home/data_layer/data_sources/produts_remote_data_sources.dart';
import 'package:new_app/features/home/domain_layer/entities/products.dart';
import 'package:new_app/features/home/domain_layer/repository/produts_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductsRemoteDataSources productsRemoteDataSources;

  ProductRepositoryImpl({required this.productsRemoteDataSources});

  @override
  Future<List<ProductsEntities>> getAllProducts() async {
    try {
      final products = await productsRemoteDataSources.getAllProducts();
      return products;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
