import 'package:either_dart/either.dart';
import '../entities/product_entity.dart';
import '../failures/failures.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> readProductListFromDataSource(
      {String? searchText, required int page});
  Future<Either<Failure, ProductEntity>> readProductDetailFromDataSource(
      {required String id});
  Future<Either<Failure, bool>> createProductToDataSource(
      {required ProductEntity productParam});
  Future<Either<Failure, bool>> updateProductToDataSource(
      {required ProductEntity productParam});
  Future<Either<Failure, bool>> deleteProductToDataSource({required int id});
}
