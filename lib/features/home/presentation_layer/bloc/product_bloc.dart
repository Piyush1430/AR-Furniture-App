import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/features/home/domain_layer/entities/products.dart';
import 'package:new_app/features/home/domain_layer/usecases/get_all_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsUsecase _getAllProductsUsecase;

  ProductBloc({
    required GetAllProductsUsecase getAllProductsUsecase,
  })  : _getAllProductsUsecase = getAllProductsUsecase,
        super(ProductInitial()) {
    on<ProductEvent>((_, emit) => emit(ProductLoading()));

    on<ProductFetchAllModelEvent>(_onFetchAllProducts);
  }

  void _onFetchAllProducts(
    ProductFetchAllModelEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final model = await _getAllProductsUsecase();
      emit(ProductModelLoadSucess(products: model));
    } catch (e) {
      emit(
        ProductModelLoadFailure(msg: e.toString()),
      );
    }
  }

 
}
