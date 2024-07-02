import 'package:ecommerce_app/src/feature/product/domain/entities/product_entity.dart';
import 'package:ecommerce_app/src/feature/product/domain/repositories/product_repository.dart';

class FetchAllProductsUsecase {
  final ProductRepository productRepository;

  FetchAllProductsUsecase({required this.productRepository});

  Future<List<ProductEntity>> call([bool onRefresh = false]) async {
    return await productRepository.fetchAllProducts(onRefresh);
  }
}
