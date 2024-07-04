import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height,
    this.width,
    this.color,
  });

  final double? height, width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.lightWhite,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
