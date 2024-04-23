import 'dart:convert';

import 'package:assignment7/features/home/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductDataSource{


  Future<List<ProductModel>>  fetchProducts(String category) async{
    print("\nInside products data source\n");
    var client = http.Client();
    try { 
      print("Trying for response !");
      String url ;
      print('\n\n\n\nCategory :${category} \n\n\n\n');
      if(category == "all"){
        url = "https://fakestoreapi.com/products";
      }
      else{
        url = "https://fakestoreapi.com/products/category/${category}";
      }
      final response = await client.get(Uri.parse(url));

      if(response.statusCode == 200){

      print(response.body);
       final List<dynamic> productsJonsArray = jsonDecode(response.body);
       print(productsJonsArray);
       print(productsJonsArray.map((e)=>ProductModel.fromJson(e)).toList());
       return productsJonsArray.map((e)=>ProductModel.fromJson(e)).toList();
       
      }
      else{
        return [];
      }
    } catch (e) {
      throw Exception("Error occured !");
    }

  }
}