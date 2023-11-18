import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';

mixin ProductMapper {
  ProductEntity productModelToEntity(ProductModel model) {
    final entity = ProductEntity(
      id: model.id,
      name: model.name,
      price: model.price,
      stock: model.stock,
    );

    return entity;
  }

  ProductModel productEntityToModel(ProductEntity entity) {
    final model = ProductModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      stock: entity.stock,
    );

    return model;
  }
}
