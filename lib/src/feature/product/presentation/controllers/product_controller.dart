import 'dart:developer';

import 'package:ecommerce_app/src/feature/product/domain/entities/product_entity.dart';
import 'package:ecommerce_app/src/feature/product/domain/use_cases/fetch_all_products_usecase.dart';
import 'package:flutter/foundation.dart';

class ProductController extends ChangeNotifier {
  final FetchAllProductsUsecase fetchAllProductsUsecase;

  ProductController({required this.fetchAllProductsUsecase});

  List<ProductEntity> products = [];

  fetchAllProducts() async {
    products = await fetchAllProductsUsecase.call();
    log('Products length from controller: ${products.length}');
    notifyListeners();
  }
}
