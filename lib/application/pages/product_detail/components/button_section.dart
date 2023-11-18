import 'package:brik_assignment/application/pages/product_detail/cubit/product_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key, required this.isCreate});

  final bool isCreate;

  @override
  Widget build(BuildContext context) {
    if (isCreate) {
      return ElevatedButton(
        onPressed: () => context.read<ProductDetailCubit>().createProduct(),
        child: Text(isCreate ? 'Create Product' : 'Update Product'),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () =>
                context.read<ProductDetailCubit>().deleteProduct(0),
            child: const Text('Delete'),
          ),
          ElevatedButton(
            onPressed: () => context.read<ProductDetailCubit>().updateProduct(),
            child: const Text('Update'),
          )
        ],
      );
    }
  }
}
