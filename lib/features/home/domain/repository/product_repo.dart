import 'package:assignment7/features/home/data/models/category_model.dart';
import 'package:assignment7/features/home/data/models/product_model.dart';
import 'package:assignment7/features/home/domain/entities/product_entity.dart';
import 'package:flutter/foundation.dart';

abstract class ProductRepo {

  Future<List<ProductModel>> getProducts(String category);
  Future<List<CategoryModel>> getCategories();

}