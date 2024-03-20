part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class ProductFetchAllModelEvent extends ProductEvent {}

final class ProductRecentlyViewEvent extends ProductEvent{
  final ProductsEntities productsEntities;

  ProductRecentlyViewEvent( {required this.productsEntities});
}
