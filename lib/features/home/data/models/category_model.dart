
import 'package:assignment7/features/home/domain/entities/category_entity.dart';

class CategoryModel extends Category{


  CategoryModel({required String category}):super(category : category);

  
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    category:  json['category'],
      );

}