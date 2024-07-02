import 'package:ecommerce_app/src/feature/product/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> fetchAllProducts();
}
