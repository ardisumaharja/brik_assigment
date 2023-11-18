part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsFetchEvent extends ProductsEvent {
  final int page;
  final String? searchingText;
  ProductsFetchEvent({required this.page, this.searchingText});
}

class ProductsRefreshEvent extends ProductsEvent {
  ProductsRefreshEvent();
}
