import 'package:ecommerce_app/src/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/src/feature/product/domain/entities/product_entity.dart';

class ProductMapper {
  static ProductEntity mapToEntity(ProductModel model) {
    return ProductEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      category: model.category,
      price: model.price,
      discountedPrice: model.discountedPrice,
      discountPrecentage: model.discountPrecentage,
      rating: model.rating,
      stock: model.stock,
      images: model.images,
      tags: model.tags,
      thumbnail: model.thumbnail,
      meta: model.meta,
      weight: model.weight,
      warrantyInfo: model.warrantyInfo,
      shippingInfo: model.shippingInfo,
      availabilityStatus: model.availabilityStatus,
      returnPolicy: model.returnPolicy,
      minimumOrderQuantity: model.minimumOrderQuantity,
      reviews: model.reviews,
    );
  }

  static ProductModel mapToModel(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      category: entity.category,
      price: entity.price,
      discountedPrice: entity.discountedPrice,
      discountPrecentage: entity.discountPrecentage,
      rating: entity.rating,
      stock: entity.stock,
      images: entity.images,
      tags: entity.tags,
      thumbnail: entity.thumbnail,
      meta: entity.meta,
      weight: entity.weight,
      warrantyInfo: entity.warrantyInfo,
      shippingInfo: entity.shippingInfo,
      availabilityStatus: entity.availabilityStatus,
      returnPolicy: entity.returnPolicy,
      minimumOrderQuantity: entity.minimumOrderQuantity,
      reviews: entity.reviews,
    );
  }
}
