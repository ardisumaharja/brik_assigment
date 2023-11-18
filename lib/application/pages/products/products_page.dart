import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:brik_assignment/application/pages/products/bloc/products_bloc.dart';
import 'package:brik_assignment/application/pages/products/components/button_add_product_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'components/list_product_section.dart';
import 'components/search_product_section.dart';

@RoutePage()
class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final productsBloc = GetIt.I<ProductsBloc>();

  void _onRefresh() {
    productsBloc.add(ProductsRefreshEvent());
  }

  @override
  void initState() {
    productsBloc.add(ProductsFetchEvent(page: 1, searchingText: ''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => productsBloc,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Products'),
          ),
          body: RefreshIndicator(
            onRefresh: () async => _onRefresh(),
            child: Padding(
              padding: const EdgeInsets.only(right: 18, left: 18, top: 10),
              child: Column(children: [
                SearchProductSection(
                  onChange: (value) => {},
                ),
                const ListProductSection(
                  productList: [],
                ),
              ]),
            ),
          ),
          floatingActionButton: ButtonAddProductSection(
            onTapBack: () => {},
          ),
        ));
  }
}
