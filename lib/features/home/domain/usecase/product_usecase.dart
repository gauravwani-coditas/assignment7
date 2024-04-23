
import 'package:assignment7/core/di.dart';
import 'package:assignment7/features/home/data/models/category_model.dart';
import 'package:assignment7/features/home/data/models/product_model.dart';
import 'package:assignment7/features/home/data/repository/product_repo_definition.dart';

class ProductUseCase{


  Future<List<CategoryModel>> getCategoriesUsecase(String category) async{
    List<CategoryModel> categories = await locator<ProductRepoDefinition>().getCategories();
    return categories;
  }

  Future<List<ProductModel>> getProductsUsecase(String category) async{
    print("\nInside ProductUsecase : \n");
    List<ProductModel> products = await locator<ProductRepoDefinition>().getProducts(category);
    print("Inside Product Repo Definition : ${products}");
    return products;
  }

}