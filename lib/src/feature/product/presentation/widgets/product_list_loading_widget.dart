import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:ecommerce_app/src/config/utils/gap.dart';
import 'package:ecommerce_app/src/config/utils/loading_skelton.dart';
import 'package:flutter/material.dart';

class ProductListLoadingWidget extends StatelessWidget {
  const ProductListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Center(
          child: Wrap(
            spacing: 15,
            runSpacing: 15,
            children: List.generate(
              10,
              (index) => Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
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
                      const Skelton(height: 160),
                      gap(height: 15),
                      const Skelton(height: 15),
                      gap(height: 12),
                      const Skelton(),
                      gap(height: 10),
                      const Skelton(width: 120),
                      gap(height: 10),
                      const Skelton(width: 80),
                      gap(height: 10),
                      const Skelton(width: 100),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
