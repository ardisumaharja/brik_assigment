import 'package:brik_assignment/application/pages/product_detail/cubit/product_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/molecule/regular_input.dart';

class FormSection extends StatefulWidget {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final stockCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    priceCtrl.dispose();
    stockCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegularInput(
          label: 'Name',
          onChange: (value) {
            context.read<ProductDetailCubit>().onNameChanged(value);
          },
        ),
        const SizedBox(height: 20),
        RegularInput(
          label: 'Price',
          inputType: TextInputType.number,
          onChange: (value) {
            context.read<ProductDetailCubit>().onPriceChanged(value);
          },
        ),
        const SizedBox(height: 20),
        RegularInput(
          label: 'Stock',
          inputType: TextInputType.number,
          onChange: (value) {
            context.read<ProductDetailCubit>().onStockChanged(value);
          },
        ),
      ],
    );
  }
}
