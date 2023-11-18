import '../../models/product_model.dart';

abstract class ProducRemoteDataSourceInterface {
  Future<List<ProductModel>> readListProduct(
      {String? searchText, required int page});
  Future<ProductModel> readDetailProduct({required String id});
  Future<bool> createProduct({required ProductModel productParams});
  Future<bool> updateProduct({required ProductModel productParams});
  Future<bool> deleteProduct({required int id});
}
