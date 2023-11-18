import 'dart:developer';

import 'package:brik_assignment/application/pages/product_detail/cubit/product_detail_cubit.dart';
import 'package:brik_assignment/data/data_sources/interface/product_remote_data_source_interface.dart';
import 'package:brik_assignment/data/data_sources/remote/product_remote_data_source.dart';
import 'package:brik_assignment/data/repositories/product_repo_remote.dart';
import 'package:brik_assignment/domain/repositories/movie_repo.dart';
import 'package:brik_assignment/domain/use_cases/product_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../pages/products/bloc/products_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  /// ========================= EXTERNAL =========================
  getIt.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        baseUrl: 'https://asdf',
      )
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (obj) {
            log(obj.toString(), name: 'NETWORK');
          },
        ),
      ),
  );

  /// ========================= END EXTERNAL =========================

  /// ========================= REPOSITORY =========================
  getIt.registerLazySingleton<ProductRepo>(
      () => ProductRepoRemote(remoteDataSource: getIt()));

  /// ========================= END REPOSITORY =========================

  // / ========================= STATE MANAGEMENT =========================
  getIt.registerFactory(
      () => ProductsBloc(productUseCase: ProductUseCase(productRepo: getIt())));
  getIt.registerFactory(() =>
      ProductDetailCubit(productUseCase: ProductUseCase(productRepo: getIt())));

  /// ========================= END STATE MANAGEMENT =========================

  /// ========================= SERVICE =========================

  getIt.registerLazySingleton<ProducRemoteDataSourceInterface>(
    () => ProductRemoteDataSource(httpClient: getIt()),
  );

  /// ========================= END SERVICE =========================
}
