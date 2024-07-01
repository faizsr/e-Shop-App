import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final String btnText;

  const CustomFilledButton({
    super.key,
    required this.onPressed,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      btnText,
      style: AppTextStyles.primary(),
    );

    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.6,
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: AppColors.blue,
      disabledColor: AppColors.blue.withOpacity(0.5),
      onPressed: onPressed,
      child: child,
    );
  }
}
