import 'dart:convert';

import 'package:assignment7/features/home/data/models/category_model.dart';
import 'package:dio/dio.dart';

class CategoryDataSource {
  Future<List<CategoryModel>> fetchCategories() async {
    Dio dio = Dio();
    try {
      Response response =
          await dio.get("https://fakestoreapi.com/products/categories");
      if (response.statusCode == 200) {
        final jsonArray = response.data;
        List<CategoryModel> categories =
            jsonArray.map((e) => CategoryModel.fromJson(e));
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception("Error occured !");
    }
  }
}
