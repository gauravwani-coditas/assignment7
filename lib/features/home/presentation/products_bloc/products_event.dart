part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class ProductsLoadingEvent extends ProductsEvent {
  ProductsLoadingEvent({required this.category});
  final String category;
}

class ProductsSuccesEvent extends ProductsEvent {}

class ProductsFailureEvent extends ProductsEvent {}
