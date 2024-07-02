import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAlerts {
  static SnackBar snackBar(String message) {
    return SnackBar(
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.blue,
      elevation: 0,
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
  }
}
