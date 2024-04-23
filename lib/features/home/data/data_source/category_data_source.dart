import 'dart:convert';

import 'package:assignment7/features/home/data/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryDataSource{


  Future<List<CategoryModel>>  fetchCategories() async{
    var client = http.Client();
    try {
      var response = await client
          .get(Uri.parse("https://fakestoreapi.com/products/categories"));

      if(response.statusCode == 200){
       final jsonArray = jsonDecode(response.body);
       List<CategoryModel> categories = jsonArray.map((e)=>CategoryModel.fromJson(e));
       return categories;
      }
      else{
        return [];
      }
    } catch (e) {
      throw Exception("Error occured !");
    }

  }
}