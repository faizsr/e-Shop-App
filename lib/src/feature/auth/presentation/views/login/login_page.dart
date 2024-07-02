import 'dart:developer';

import 'package:ecommerce_app/src/config/utils/navigates.dart';
import 'package:ecommerce_app/src/config/utils/validations.dart';
import 'package:ecommerce_app/src/feature/product/presentation/views/product_list/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/src/config/utils/alerts.dart';
import 'package:ecommerce_app/src/feature/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/views/signup/signup_page.dart';
import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:ecommerce_app/src/config/utils/gap.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/auth_helper_widget.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/custom_filled_button.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/custom_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Text(
              'e-Shop',
              style: AppTextStyles.heading(),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                CustomTextFormField(
                  controller: emailController,
                  validator: validateEmail,
                  hintText: 'Email',
                ),
                gap(height: 20),
                CustomTextFormField(
                  controller: passwordController,
                  validator: validatePasswordLogin,
                  hintText: 'Password',
                ),
                const Spacer(),
                CustomFilledButton(
                  onPressed: onLoginPressed,
                  btnText: 'Login',
                ),
                gap(height: 12),
                AuthHelperWidget(
                  text1: 'New here? ',
                  text2: 'Signup',
                  onTap: () {
                    nextScreen(context, const SignUpPage());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() async {
    final authController = Provider.of<AuthController>(context, listen: false);
    if (formKey.currentState!.validate()) {
      final user = UserEntity(
        email: emailController.text,
        password: passwordController.text,
      );
      await authController.signIn(user);
    }

    String result = authController.result;
    log('Result from ui: $result');
    if (result == 'success') {
      nextScreenRemoveUntil(context, const ProductListPage());
      final snackbar = CustomAlerts.snackBar('Sucessfully Logged In');
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (result == 'user-not-found') {
      final snackbar = CustomAlerts.snackBar('User not found');
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (result == 'wrong-password') {
      final snackBar = CustomAlerts.snackBar('Incorrect password');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (result == 'too-many-requests') {
      final snackBar =
          CustomAlerts.snackBar('Too many requests. Please try again later.');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
