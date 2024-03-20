import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_app/features/home/domain_layer/entities/products.dart';

class ProductsModel extends ProductsEntities {
  ProductsModel({
    required super.id,
    required super.name,
    required super.descripition,
    required super.price,
    required super.imageUrl,
    required super.modelUrl,
    required super.title,
  });

  factory ProductsModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return ProductsModel(
      id: doc.id,
      name: data['name'] ?? '',
      descripition: data['descripition'] ?? '',
      price: data['price'] ?? "",
      imageUrl: data['imageUrl'] ?? '',
      modelUrl: data['modelUrl'] ?? '',
      title: data['title'] ?? '',
    );
  }
}
