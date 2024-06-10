import 'dart:convert';

import 'package:assignment7/features/home/data/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductDataSource {
  Future<List<ProductModel>> fetchProducts(String category) async {
    try {
      String url;
      print('\n\n\n\nCategory :${category} \n\n\n\n');
      if (category == "all") {
        url = "https://fakestoreapi.com/products";
      } else {
        url = "https://fakestoreapi.com/products/category/${category}";
      }
      

      Dio dio = Dio();
      Response myResponse = await dio.get(url);
      if (myResponse.statusCode == 200) {
        final List<dynamic> productsJonsArray = myResponse.data;
        return productsJonsArray.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception("Error occured !");
    }
  }
}
