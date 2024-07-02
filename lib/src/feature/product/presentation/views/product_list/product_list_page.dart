import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:ecommerce_app/src/config/utils/navigates.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/views/login/login_page.dart';
import 'package:ecommerce_app/src/feature/product/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Center(
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: List.generate(
                  10,
                  (index) => ProductCard(size: size),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
