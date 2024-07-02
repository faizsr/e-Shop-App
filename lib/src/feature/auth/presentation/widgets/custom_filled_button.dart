import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<AuthController>(
      builder: (context, value, child) {
        Widget text = Text(
          btnText,
          style: AppTextStyles.primary(),
        );
        Widget loading = Transform.scale(
          scale: 0.6,
          child: const CircularProgressIndicator(
            strokeWidth: 3,
            color: Colors.white,
          ),
        );

        return MaterialButton(
          elevation: 0,
          minWidth: MediaQuery.of(context).size.width * 0.6,
          height: 48,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: AppColors.blue,
          disabledColor: AppColors.blue.withOpacity(0.5),
          onPressed: onPressed,
          child: value.isLoading ? loading : text,
        );
      },
    );
  }
}
