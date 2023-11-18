// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stream_transform/stream_transform.dart';

import '../../../../domain/entities/product_entity.dart';
import '../../../../domain/use_cases/product_use_case.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductUseCase productUseCase;
  ProductsBloc({
    required this.productUseCase,
  }) : super(const ProductsState()) {
    on<ProductsFetchEvent>(
      (event, emit) async {
        emit(state.copyWith(status: ProductsStateStatus.loading));
        try {
          final result = await productUseCase.getProductList(
            searchText: state.searchText,
            page: state.page,
          );
          if (result.isRight) {
            emit(
              state.copyWith(
                status: ProductsStateStatus.success,
                productList: List.from(
                  state.page == 1
                      ? result.right
                      : state.productList + result.right,
                ),
              ),
            );
          } else {
            emit(state.copyWith(
              status: ProductsStateStatus.success,
              productList: [],
              error: result.left.toString(),
            ));
          }
        } catch (error, stackTrace) {
          log(stackTrace.toString(),
              stackTrace: stackTrace, error: error, name: 'ERROR');
          emit(state.copyWith(status: ProductsStateStatus.failure));
        }
      },
      // transformer: (events, mapper) =>
      //     events.debounce(const Duration(milliseconds: 300)),
    );
    on<ProductsRefreshEvent>((event, emit) async {
      emit(state.copyWith(status: ProductsStateStatus.loading, page: 1));
      try {
        final result = await productUseCase.getProductList(
          searchText: state.searchText,
          page: state.page,
        );
        if (result.isRight) {
          emit(state.copyWith(
              status: ProductsStateStatus.success, productList: result.right));
        } else {
          emit(state.copyWith(
            status: ProductsStateStatus.success,
            productList: [],
            error: result.left.toString(),
          ));
        }
      } catch (error, stackTrace) {
        log(stackTrace.toString(),
            stackTrace: stackTrace, error: error, name: 'ERROR');
        emit(state.copyWith(status: ProductsStateStatus.failure));
      }
    });
  }
}
