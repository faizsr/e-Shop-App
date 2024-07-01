import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle heading() => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.blue,
      );

  static TextStyle heading2() => const TextStyle(
        fontSize: 14.5,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      );

  static TextStyle help() => const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.blue,
      );

  static TextStyle primary() => const TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      );
}
