import 'package:assignment7/features/home/data/data_source/category_data_source.dart';
import 'package:assignment7/features/home/data/data_source/product_data_source.dart';
import 'package:assignment7/features/home/data/repository/product_repo_definition.dart';
import 'package:assignment7/features/home/domain/repository/product_repo.dart';
import 'package:assignment7/features/home/domain/usecase/product_usecase.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setDi(){

  locator.registerSingleton<CategoryDataSource>(CategoryDataSource());
  locator.registerSingleton<ProductDataSource>(ProductDataSource());
  locator.registerSingleton<ProductRepoDefinition>(ProductRepoDefinition());
  locator.registerSingleton<ProductUseCase>(ProductUseCase());
}