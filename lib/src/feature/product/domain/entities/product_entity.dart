import 'package:ecommerce_app/src/feature/product/data/models/meta_model.dart';
import 'package:ecommerce_app/src/feature/product/data/models/review_model.dart';

class ProductEntity {
  final int id;
  final String title;
  final String description;
  final String category;
  final num price;
  num discountedPrice;
  final num discountPrecentage;
  final num rating;
  final int stock;
  final String thumbnail;
  final List<String> images;
  final Meta meta;
  final List<String> tags;
  final int weight;
  final String warrantyInfo;
  final String shippingInfo;
  final String availabilityStatus;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final List<Review> reviews;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    this.discountedPrice = 0,
    required this.discountPrecentage,
    required this.rating,
    required this.stock,
    required this.thumbnail,
    required this.images,
    required this.meta,
    required this.tags,
    required this.weight,
    required this.warrantyInfo,
    required this.shippingInfo,
    required this.availabilityStatus,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.reviews,
  });
}
