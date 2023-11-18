import 'dart:developer';

import 'package:either_dart/either.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/failures/failures.dart';
import '../../domain/repositories/movie_repo.dart';
import '../data_sources/interface/product_remote_data_source_interface.dart';
import '../exceptions copy/exceptions.dart';
import '../mappers/product_mapper.dart';

class ProductRepoRemote with ProductMapper implements ProductRepo {
  final ProducRemoteDataSourceInterface remoteDataSource;

  ProductRepoRemote({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> readProductListFromDataSource(
      {String? searchText, required int page}) async {
    try {
      final result = await remoteDataSource.readListProduct(
          searchText: searchText, page: page);
      log('RESULT $result');
      return Right(result.map((e) => productModelToEntity(e)).toList());
    } on ErrorException catch (e) {
      log('ERROR_REPO_EXCEPTION');
      return Left(CacheFailure(stackTrace: e.toString()));
    } catch (e) {
      log('ERROR_REPO_CATCH');
      return Left(CacheFailure(stackTrace: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateProductToDataSource(
      {required ProductEntity productParam}) async {
    try {
      final result = await remoteDataSource.updateProduct(
          productParams: productEntityToModel(productParam));
      return Right(result);
    } on ErrorException catch (e) {
      return Left(CacheFailure(stackTrace: e.toString()));
    } catch (e) {
      return Left(CacheFailure(stackTrace: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProductToDataSource(
      {required int id}) async {
    try {
      final result = await remoteDataSource.deleteProduct(id: id);
      return Right(result);
    } on ErrorException catch (e) {
      return Left(CacheFailure(stackTrace: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> readProductDetailFromDataSource(
      {required String id}) async {
    try {
      final result = await remoteDataSource.readDetailProduct(id: id);
      return Right(productModelToEntity(result));
    } on ErrorException catch (e) {
      return Left(CacheFailure(stackTrace: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createProductToDataSource(
      {required ProductEntity productParam}) async {
    try {
      final result = await remoteDataSource.createProduct(
          productParams: productEntityToModel(productParam));
      return Right(result);
    } on ErrorException catch (e) {
      return Left(CacheFailure(stackTrace: e.toString()));
    }
  }
}
