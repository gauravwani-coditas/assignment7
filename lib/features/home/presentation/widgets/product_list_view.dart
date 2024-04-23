import 'package:assignment7/features/home/presentation/products_bloc/products_bloc.dart';
import 'package:assignment7/features/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListView extends StatelessWidget {
  final String category;
  const ProductListView({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsBloc>(context)
        .add(ProductsLoadingEvent(category: category));

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProductsLoadingState:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ProductsSuccessState:
            final currentState = state as ProductsSuccessState;
            return ListView.builder(
              itemCount: currentState.products.length,
              itemBuilder: (context, index) => ProductItem(
                product: currentState.products[index],
              ),
            );
          case ProductsFailureState:
            return Text("No Products Found !");
          default:
            return Text("No Products Found !");
        }
      },
    );
  }
}
