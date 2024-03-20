
import 'package:new_app/features/home/domain_layer/entities/products.dart';

abstract class ProductRepository {
  //getting roducts from config/ products model file
  Future< List<ProductsEntities>> getAllProducts();


}
