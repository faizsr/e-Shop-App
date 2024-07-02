import 'dart:developer';

import 'package:ecommerce_app/src/feature/product/domain/entities/product_entity.dart';
import 'package:ecommerce_app/src/feature/product/domain/use_cases/fetch_all_products_usecase.dart';
import 'package:ecommerce_app/src/feature/product/domain/use_cases/get_discount_status_usecase.dart';
import 'package:flutter/foundation.dart';

class ProductController extends ChangeNotifier {
  final FetchAllProductsUsecase fetchAllProductsUsecase;
  final GetDiscountStatusUsecase getDiscountStatusUsecase;

  ProductController({
    required this.fetchAllProductsUsecase,
    required this.getDiscountStatusUsecase,
  });

  List<ProductEntity> products = [];
  bool isLoading = false;
  bool discountStatus = false;

  fetchAllProducts() async {
    isLoading = true;
    notifyListeners();

    products = await fetchAllProductsUsecase.call();
    discountStatus = await getDiscountStatusUsecase.call();
    log('Products length from controller: ${products.length}');
    log('Discount status from controller: $discountStatus');
    notifyListeners();

    isLoading = false;
    notifyListeners();
  }
}
