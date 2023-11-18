import 'package:auto_route/auto_route.dart';
import 'package:brik_assignment/application/pages/product_detail/components/button_section.dart';
import 'package:brik_assignment/application/pages/product_detail/components/form_section.dart';
import 'package:brik_assignment/application/pages/product_detail/cubit/product_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.isCreate});

  final bool isCreate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: BlocProvider(
            create: (context) => GetIt.I<ProductDetailCubit>(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FormSection(),
                const Expanded(child: SizedBox()),
                ButtonSection(isCreate: isCreate)
              ],
            ),
          )),
    );
  }
}
