import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/src/config/constants/strings.dart';
import 'package:ecommerce_app/src/feature/product/data/data_sources/remote/product_remote_data_source.dart';
import 'package:ecommerce_app/src/feature/product/data/mappers/product_mapper.dart';
import 'package:ecommerce_app/src/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/src/feature/product/domain/entities/product_entity.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductEntity>> fetchAllProducts({int skipUpto = 0}) async {
    List<ProductEntity> products = [];

    try {
      var response = await dio.get('$baseUrl?limit=10&skip=$skipUpto');
      log('Response Statuscode: ${response.statusCode}');
      if (response.statusCode == 200) {
        List jsonProducts = response.data['products'];
        int totalProducts = response.data['total'];
        for (int i = 0; i < jsonProducts.length; i++) {
          ProductModel productMo = ProductModel.fromJson(jsonProducts[i]);
          productMo.totalProducts = totalProducts;
          // Calcuating Discounted Price
          double discountedPrice = (productMo.price -
              (productMo.price * (productMo.discountPrecentage / 100)));
          productMo.discountedPrice =
              double.parse(discountedPrice.toStringAsFixed(2));

          ProductEntity productEn = ProductMapper.mapToEntity(productMo);
          products.add(productEn);
        }
        log('Products length from data source: ${products.length}');
      }
    } catch (e) {
      log('Fetch Products Error: $e');
    }
    return products;
  }
}
