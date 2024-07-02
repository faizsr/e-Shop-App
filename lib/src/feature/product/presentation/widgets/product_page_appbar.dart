import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:ecommerce_app/src/config/utils/navigates.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPageAppbar extends StatelessWidget {
  const ProductPageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: AppColors.blue,
      title: Text(
        'e-Shop',
        style: AppTextStyles.primary(),
      ),
      actions: [
        IconButton(
          onPressed: () {
            nextScreenReplacement(context, const LoginPage());
            Provider.of<AuthController>(context, listen: false).signOut();
          },
          icon: const Icon(Icons.logout, color: AppColors.white),
        )
      ],
    );
  }
}
