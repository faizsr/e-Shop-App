import 'package:ecommerce_app/src/feature/product/data/models/meta_model.dart';
import 'package:ecommerce_app/src/feature/product/data/models/review_model.dart';
import 'package:ecommerce_app/src/feature/product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.price,
    super.discountedPrice = 0,
    required super.discountPrecentage,
    required super.rating,
    required super.stock,
    required super.thumbnail,
    required super.images,
    required super.meta,
    required super.tags,
    required super.weight,
    required super.warrantyInfo,
    required super.shippingInfo,
    required super.availabilityStatus,
    required super.returnPolicy,
    required super.minimumOrderQuantity,
    required super.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      discountPrecentage: json['discountPercentage'],
      rating: json['rating'],
      stock: json['stock'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(
        json['images']!.map((image) => image.toString()),
      ),
      meta: Meta.fromJson(json['meta']),
      tags: List<String>.from(
        json['tags']!.map((tag) => tag.toString()),
      ),
      weight: json['weight'],
      warrantyInfo: json['warrantyInformation'],
      shippingInfo: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      reviews: List<Review>.from(
        json['reviews']!.map((review) => Review.fromJson(review)),
      ),
    );
  }
}
