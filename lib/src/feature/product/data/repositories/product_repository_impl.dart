import 'package:ecommerce_app/src/feature/product/data/data_sources/remote/product_remote_data_source.dart';
import 'package:ecommerce_app/src/feature/product/domain/entities/product_entity.dart';
import 'package:ecommerce_app/src/feature/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<List<ProductEntity>> fetchAllProducts({int skipUpto = 0}) async {
    return productRemoteDataSource.fetchAllProducts(skipUpto: skipUpto);
  }
}
