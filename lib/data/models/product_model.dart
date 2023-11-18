// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final int price;
  final double stock;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });

  @override
  List<Object?> get props => [id, name, price, stock];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      // id: map['id'] as int,
      // name: map['name'] as String,
      // price: map['price'] as int,
      // stock: map['stock'] as double,
      id: 0,
      name: map['name'] as String,
      price: 0,
      stock: 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
