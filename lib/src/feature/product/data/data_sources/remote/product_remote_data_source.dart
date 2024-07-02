import 'package:ecommerce_app/src/feature/product/domain/entities/product_entity.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> fetchAllProducts([bool onRefresh = false]);
}
