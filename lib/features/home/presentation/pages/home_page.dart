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
            labelPadding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
        body: const TabBarView(children: [
          ProductListView(category: "all"),
          ProductListView(category: "electronics"),
          ProductListView(category: "jewelery"),
          ProductListView(category: "men's clothing"),
          ProductListView(category: "women's clothing"),
        ]),
      ),
    );
  }
}
