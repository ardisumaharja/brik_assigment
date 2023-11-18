// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:brik_assignment/domain/use_cases/product_use_case.dart';

import '../../../../domain/entities/product_entity.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final ProductUseCase productUseCase;

  ProductDetailCubit({
    required this.productUseCase,
  }) : super(const ProductDetailState(name: '', price: 0, stock: 0));

  void onNameChanged(String value) {
    _validateState(state.copyWith(name: value));
  }

  void onPriceChanged(String value) {
    _validateState(state.copyWith(price: int.parse(value)));
  }

  void onStockChanged(String value) {
    _validateState(state.copyWith(stock: double.parse(value)));
  }

  void _validateState(ProductDetailState state) {
    emit(state.copyWith(
      name: state.name,
      price: state.price,
      stock: state.stock,
    ));
  }

  Future createProduct() async {
    emit(state.copyWith(status: ProductDetailStateStatus.loading));
    try {
      final result =
          productUseCase.createProduct(productParam: state.toPayload());
      emit(state.copyWith(status: ProductDetailStateStatus.success));
    } catch (error, stackTrace) {
      _recordLogError(error, stackTrace);
    }
  }

  Future updateProduct() async {
    emit(state.copyWith(status: ProductDetailStateStatus.loading));
    try {
      final result =
          productUseCase.updateProduct(productParam: state.toPayload());
      emit(state.copyWith(status: ProductDetailStateStatus.success));
    } catch (error, stackTrace) {
      _recordLogError(error, stackTrace);
    }
  }

  Future deleteProduct(int id) async {
    emit(state.copyWith(status: ProductDetailStateStatus.loading));
    try {
      final result = productUseCase.deleteProduct(id: id);
      emit(state.copyWith(status: ProductDetailStateStatus.success));
    } catch (error, stackTrace) {
      _recordLogError(error, stackTrace);
    }
  }

  void _recordLogError(Object error, StackTrace stackTrace) {
    log(stackTrace.toString(),
        stackTrace: stackTrace, error: error, name: 'ERROR');
    emit(state.copyWith(status: ProductDetailStateStatus.failure));
  }
}
