part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final ProductsStateStatus? status;
  final String? error;
  final int page;
  final String searchText;
  final List<ProductEntity> productList;

  const ProductsState({
    this.status,
    this.error,
    this.page = 1,
    this.searchText = '',
    this.productList = const [],
  });

  @override
  List<Object?> get props => [
        status,
        error,
        page,
        searchText,
      ];

  ProductsState copyWith({
    ProductsStateStatus? status,
    String? error,
    int? page,
    String? searchText,
    List<ProductEntity>? productList,
  }) {
    return ProductsState(
      status: status ?? this.status,
      error: error ?? this.error,
      page: page ?? this.page,
      searchText: searchText ?? this.searchText,
      productList: productList ?? this.productList,
    );
  }
}

enum ProductsStateStatus { success, failure, loading }
