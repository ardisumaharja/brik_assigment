import 'package:flutter/material.dart';

class CardItemProduct extends StatelessWidget {
  const CardItemProduct(
      {super.key,
      required this.name,
      required this.price,
      required this.stock});

  final String name;
  final int price;
  final double stock;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(name),
            const SizedBox(height: 10),
            Text('Price : ${price.toString()}'),
            const SizedBox(height: 10),
            Text('Stock : ${stock.toString()}'),
          ],
        ),
      ),
    );
  }
}
