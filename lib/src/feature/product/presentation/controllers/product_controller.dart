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
  int skipUpto = 0;
  int totalProducts = 0;

  fetchAllProducts({bool onRefresh = false}) async {
    if (onRefresh) {
      isLoading = true;
      notifyListeners();
      products = await fetchAllProductsUsecase.call();
      notifyListeners();
    } else {
      skipUpto += 10;
      totalProducts = products[products.length - 1].totalProducts;
      if (products.length < totalProducts) {
        products.addAll(await fetchAllProductsUsecase.call(skipUpto: skipUpto));
      }
      notifyListeners();
    }
    discountStatus = await getDiscountStatusUsecase.call();
    log('Products length from controller: ${products.length}');
    log('Discount status from controller: $discountStatus');
    notifyListeners();

    isLoading = false;
    notifyListeners();
    return [products.length, totalProducts];
  }
}
