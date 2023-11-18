// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  final ProductDetailStateStatus? status;
  final String? error;
  final String name;
  final int price;
  final double stock;

  const ProductDetailState({
    this.status,
    this.error,
    required this.name,
    required this.price,
    required this.stock,
  });

  @override
  List<Object?> get props => [
        status,
        error,
        name,
        price,
        stock,
      ];

  ProductDetailState copyWith({
    ProductDetailStateStatus? status,
    String? error,
    String? name,
    int? price,
    double? stock,
  }) {
    return ProductDetailState(
      status: status ?? this.status,
      error: error ?? this.error,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
    );
  }
}

enum ProductDetailStateStatus { success, failure, loading }

extension ProductDetailStateX on ProductDetailState {
  ProductEntity toPayload() {
    return ProductEntity(id: 0, name: name, price: price, stock: stock);
  }
}
