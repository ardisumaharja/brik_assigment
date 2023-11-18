import 'package:auto_route/auto_route.dart';
import 'package:brik_assignment/application/core/router/app_router.dart';
import 'package:flutter/material.dart';

class ButtonAddProductSection extends StatelessWidget {
  const ButtonAddProductSection({super.key, required this.onTapBack});

  final VoidCallback onTapBack;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.router
          .push(
            ProductDetailRoute(isCreate: true),
          )
          .then((_) => onTapBack.call()),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
