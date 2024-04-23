part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<ProductModel> products;

  ProductsSuccessState({required this.products});
}

class ProductsFailureState extends ProductsState {}

class ProductTypeState extends ProductsState {}
