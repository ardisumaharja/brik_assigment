import 'package:dio/dio.dart';

import '../../models/product_model.dart';
import '../interface/product_remote_data_source_interface.dart';
import 'service_network_handler_mixin.dart';

class ProductRemoteDataSource
    with ServiceNetworkHandlerMixin
    implements ProducRemoteDataSourceInterface {
  final Dio httpClient;
  ProductRemoteDataSource({
    required this.httpClient,
  });

  @override
  Future<bool> createProduct({required ProductModel productParams}) {
    return post<bool>(
      'https://03630fb6c53248ad91d0ab048452ef68.api.mockbin.io/',
      httpClient: httpClient,
      payload: productParams.toJson(),
      onSuccess: (response) async {
        return true;
      },
    );
  }

  @override
  Future<bool> deleteProduct({required int id}) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> readDetailProduct({required String id}) {
    // TODO: implement readDetailProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> readListProduct(
      {String? searchText, required int page}) {
    return get<List<ProductModel>>(
      'https://b9ef6d8d06d4482d81cdc9c2f2b14d3c.api.mockbin.io/',
      httpClient: httpClient,
      onSuccess: (response) async {
        return List.from(
          (response.data ?? []).map((e) => ProductModel.fromMap(e)).toList(),
        );
      },
    );
  }

  @override
  Future<bool> updateProduct({required ProductModel productParams}) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
