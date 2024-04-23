import 'package:assignment7/features/home/presentation/products_bloc/products_bloc.dart';
import 'package:assignment7/features/home/presentation/widgets/product_item.dart';
import 'package:assignment7/features/home/presentation/widgets/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
            Tab(
              text: "All",
            ),
            Tab(
              text: "electronics",
            ),
            Tab(
              text: "jewelery",
            ),
            Tab(
              text: "men's clothing",
            ),
            Tab(
              text: "women's clothing",
            )
          ],
          labelPadding: EdgeInsets.symmetric(horizontal: 16),),
        ),
        body:  TabBarView(children: [
          getProductBasedOnCategory("all",context),
          getProductBasedOnCategory("electronics",context),
          getProductBasedOnCategory("jewelery",context),
         getProductBasedOnCategory("men's clothing",context),
         getProductBasedOnCategory("women's clothing",context),
        ]),
      ),
    );
  }
}


Widget getProductBasedOnCategory(String category,BuildContext context){


  BlocProvider.of<ProductsBloc>(context).add(ProductsLoadingEvent(category: category));
  return ProductListView();


}