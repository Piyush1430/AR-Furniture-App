import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:new_app/features/home/data_layer/data_sources/produts_remote_data_sources.dart';
import 'package:new_app/features/home/data_layer/repository/product_repository_impl.dart';
import 'package:new_app/features/home/domain_layer/repository/produts_repository.dart';
import 'package:new_app/features/home/domain_layer/usecases/get_all_product_usecase.dart';
import 'package:new_app/features/home/presentation_layer/bloc/product_bloc.dart';


final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initProductModels();
  
  // firebase firestore instance
  serviceLocator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  // firebase storage inatance
  serviceLocator
      .registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);
}

void _initProductModels() {
  //remote data source
  serviceLocator
    ..registerFactory<ProductsRemoteDataSources>(
        () => ProductsRemoteDataSourcesImpl(
              firebaseStorage: serviceLocator(),
              firebaseFirestore: serviceLocator(),
            ))
    // repository
    ..registerFactory<ProductRepository>(() => ProductRepositoryImpl(
          productsRemoteDataSources: serviceLocator(),
        ))

    // usecases
    ..registerFactory(
        () => GetAllProductsUsecase(productRepository: serviceLocator()))

    // bloc
    ..registerLazySingleton(() => ProductBloc(
          getAllProductsUsecase: serviceLocator(),
        ));
}
