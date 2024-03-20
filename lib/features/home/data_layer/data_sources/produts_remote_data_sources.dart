import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:new_app/core/constants/string_manager.dart';
import 'package:new_app/core/error/exceptions.dart';
import 'package:new_app/features/home/data_layer/model/products_model.dart';

// abstract class
abstract class ProductsRemoteDataSources {
  //getting products from config/ products model file
  Future<List<ProductsModel>> getAllProducts();
}

// Implementation of the above abstract class
class ProductsRemoteDataSourcesImpl implements ProductsRemoteDataSources {
  final FirebaseStorage firebaseStorage;
  final FirebaseFirestore firebaseFirestore;

  ProductsRemoteDataSourcesImpl(
      {required this.firebaseStorage, required this.firebaseFirestore});

  @override
  Future<List<ProductsModel>> getAllProducts() async {
    try {
      final modelSnapshots = await firebaseFirestore.collection(FirebaseConstants.firebaseFirestoreCollection).get();
      final data = modelSnapshots.docs
          .map(
            (doc) => ProductsModel.fromFirestore(doc),
          )
          .toList();
      return data;
    } on FirebaseStorage catch (e) {
      throw ServerException(e.toString());
    } on FirebaseFirestore catch (e) {
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
