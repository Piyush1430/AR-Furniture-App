import 'package:new_app/features/home/domain_layer/entities/products.dart';
import 'package:new_app/features/home/domain_layer/repository/produts_repository.dart';

class GetAllProductsUsecase {
  final ProductRepository productRepository;

  GetAllProductsUsecase({required this.productRepository});

  Future<List<ProductsEntities>> call() async {
    // Add any preprocessing before retrieving the models
    return await productRepository.getAllProducts();
  }
}
