// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:brik_assignment/domain/entities/product_entity.dart';
import 'package:brik_assignment/domain/repositories/movie_repo.dart';
import 'package:either_dart/either.dart';

import '../failures/failures.dart';

class ProductUseCase {
  final ProductRepo productRepo;
  ProductUseCase({
    required this.productRepo,
  });

  Future<Either<Failure, List<ProductEntity>>> getProductList(
      {String? searchText, required int page}) async {
    try {
      final result = productRepo.readProductListFromDataSource(
          searchText: searchText, page: page);
      return result.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(CacheFailure(stackTrace: e.toString()));
    }
  }

  Future<Either<Failure, bool>> createProduct(
      {required ProductEntity productParam}) async {
    try {
      final result =
          productRepo.createProductToDataSource(productParam: productParam);
      return result.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(CacheFailure(stackTrace: e.toString()));
    }
  }

  Future<Either<Failure, bool>> updateProduct(
      {required ProductEntity productParam}) async {
    try {
      final result =
          productRepo.updateProductToDataSource(productParam: productParam);
      return result.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(CacheFailure(stackTrace: e.toString()));
    }
  }

  Future<Either<Failure, bool>> deleteProduct({required int id}) async {
    try {
      final result = productRepo.deleteProductToDataSource(id: id);
      return result.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(CacheFailure(stackTrace: e.toString()));
    }
  }
}
