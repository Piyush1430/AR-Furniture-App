part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductModelLoadSucess extends ProductState {
  final List<ProductsEntities> products;

  ProductModelLoadSucess({required this.products});
}
final class ProductrecentlyViwedSucess extends ProductState{
   final List<ProductsEntities> products;
     ProductrecentlyViwedSucess({required this.products});
}
final class ProductModelLoadFailure extends ProductState {
  final String msg;

  ProductModelLoadFailure({required this.msg});
}
