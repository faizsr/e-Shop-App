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

  List<ProductEntity> products = [];

  @override
  Future<List<ProductEntity>> fetchAllProducts() async {
    try {
      var response = await dio.get('$baseUrl?limit=20&skip=0');
      log('Response Statuscode: ${response.statusCode}');
      if (response.statusCode == 200) {
        // log('Response Data: ${response.data['products']}');
        log('Response Data Length: ${response.data['products'].length}');
        List jsonProducts = response.data['products'];
        for (int i = 0; i < jsonProducts.length; i++) {
          ProductModel productMo = ProductModel.fromJson(jsonProducts[i]);

          // Calcuating Discounted Price
          double discountedPrice = (productMo.price -
              (productMo.price * (productMo.discountPrecentage / 100)));
          productMo.discountedPrice = double.parse(discountedPrice.toStringAsFixed(2));

          log('Original Price: ${productMo.price}');
          log('Discount Percent: ${productMo.discountPrecentage}');
          log('Discounted Price: ${productMo.discountedPrice}');

          ProductEntity productEn = ProductMapper.mapToEntity(productMo);
          products.add(productEn);
        }
      }
    } catch (e) {
      log('Fetch Products Error: $e');
    }
    return products;
  }
}
