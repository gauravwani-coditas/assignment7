import 'package:assignment7/core/di.dart';
import 'package:assignment7/features/home/data/data_source/category_data_source.dart';
import 'package:assignment7/features/home/data/data_source/product_data_source.dart';
import 'package:assignment7/features/home/data/models/category_model.dart';
import 'package:assignment7/features/home/data/models/product_model.dart';
import 'package:assignment7/features/home/domain/entities/product_entity.dart';
import 'package:assignment7/features/home/domain/repository/product_repo.dart';
import 'package:flutter/src/foundation/annotations.dart';

class ProductRepoDefinition implements ProductRepo{
  
  @override
  Future<List<CategoryModel>> getCategories() async{
    List<CategoryModel> categories = await locator<CategoryDataSource>().fetchCategories();
    return categories;
  }

  @override
  Future<List<ProductModel>> getProducts(String category) async{
    print("Inside Product Repo definition");
    List<ProductModel> products = await ProductDataSource().fetchProducts(category);
    print("\nProducts in useCase : ${products}\n");
    return products;
  }

  

}