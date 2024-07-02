import 'dart:developer';

import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:ecommerce_app/src/config/utils/gap.dart';
import 'package:ecommerce_app/src/feature/product/domain/entities/product_entity.dart';
import 'package:ecommerce_app/src/feature/product/presentation/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 2 - 20,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 20,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightWhite,
                image: DecorationImage(
                  image: NetworkImage(product.thumbnail),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 160,
            ),
            gap(height: 15),
            Text(
              product.title,
              style: AppTextStyles.heading2(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            gap(height: 8),
            Text(
              product.description,
              maxLines: 3,
            ),
            gap(height: 15),
            Row(
              children: [
                discountWidget(),
                Text(
                  "\$${product.discountedPrice.round()}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                gap(width: 8),
                Text(
                  "${product.discountPrecentage.round()}% off",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.amberAccent,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Consumer<ProductController> discountWidget() {
    return Consumer<ProductController>(
      builder: (context, value, child) {
        log('Rebuilding again: ${value.discountStatus}');
        return value.discountStatus
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "\$${product.price.round()}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              )
            : gap();
      },
    );
  }
}
