import 'dart:async';
import 'dart:convert';

import 'package:assignment7/core/di.dart';
import 'package:assignment7/features/home/data/models/product_model.dart';
import 'package:assignment7/features/home/domain/entities/product_entity.dart';
import 'package:assignment7/features/home/domain/usecase/product_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsLoadingState()) {
    on<ProductsLoadingEvent>(productsLoadingEvent);
    on<ProductsFailureEvent>(productsFailureEvent);

  }

  FutureOr<void> productsLoadingEvent(
      ProductsLoadingEvent event, Emitter<ProductsState> emit) async {
        print("\nInside bloc : \n");
    emit(ProductsLoadingState());
    await Future.delayed(Duration(seconds: 1));
    try {
      print("\nInside Try \n");
      final List<ProductModel> products = await ProductUseCase().getProductsUsecase(event.category) ;
      print("Inside bloc : ${products}");
      emit(ProductsSuccessState(products: products));
    } catch (e) {
      emit(ProductsFailureState());
    }
  }

  FutureOr<void> productsFailureEvent(
      ProductsFailureEvent event, Emitter<ProductsState> emit) {
    emit(ProductsFailureState());
  }

 
}
