import 'package:ecommerce_app/src/config/constants/app_colors.dart';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.obscureText = false,
    this.suffixWidget,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: const TextStyle(fontSize: 15),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 15),
        filled: true,
        fillColor: AppColors.white,
        hoverColor: Colors.blueGrey.withOpacity(0.1),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        prefixIcon: const SizedBox(width: 15),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: suffixWidget,
      ),
    );
  }
}
