import 'package:brik_assignment/application/pages/products/components/card_item_product.dart';
import 'package:brik_assignment/application/pages/products/components/card_item_skeleton.dart';
import 'package:brik_assignment/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_bloc.dart';

class ListProductSection extends StatelessWidget {
  const ListProductSection({super.key, required this.productList});

  final List<ProductEntity> productList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state.status == ProductsStateStatus.loading) {
          return Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const CardItemSkeleton(),
            ),
          );
        }
        if (state.status == ProductsStateStatus.success) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.productList.length,
              itemBuilder: (context, index) {
                final item = state.productList[index];
                return CardItemProduct(
                    name: item.name, price: item.price, stock: item.stock);
              },
            ),
          );
        }
        // if (state.status == ProductsStateStatus.failure) {
        return const Expanded(
          child: Center(
            child: Text('No data loaded'),
          ),
        );
        // }
      },
    );
  }
}
