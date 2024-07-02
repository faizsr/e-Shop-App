import 'dart:developer';

import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:ecommerce_app/src/config/utils/alerts.dart';
import 'package:ecommerce_app/src/config/utils/gap.dart';
import 'package:ecommerce_app/src/config/utils/navigates.dart';
import 'package:ecommerce_app/src/config/utils/validations.dart';
import 'package:ecommerce_app/src/feature/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/views/login/login_page.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/auth_helper_widget.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/custom_filled_button.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/password_text_field.dart';
import 'package:ecommerce_app/src/feature/product/presentation/views/product_list/product_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 0, 0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(CupertinoIcons.arrow_left),
                ),
                gap(width: 10),
                Text(
                  'e-Shop',
                  style: AppTextStyles.heading(),
                ),
              ],
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
                  controller: nameController,
                  validator: validateName,
                  hintText: 'Name',
                ),
                gap(height: 20),
                CustomTextFormField(
                  controller: emailController,
                  validator: validateEmail,
                  hintText: 'Email',
                ),
                gap(height: 20),
                PasswordTextField(passwordController: passwordController),
                const Spacer(),
                CustomFilledButton(
                  onPressed: onSignUpPressed,
                  btnText: 'Signup',
                ),
                gap(height: 12),
                AuthHelperWidget(
                  text1: 'Already have an account? ',
                  text2: 'Login',
                  onTap: () {
                    nextScreenRemoveUntil(context, const LoginPage());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSignUpPressed() async {
    final authController = Provider.of<AuthController>(context, listen: false);
    if (formKey.currentState!.validate()) {
      final user = UserEntity(
        fullName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      await authController.signUp(user);
    }

    String result = authController.result;
    log('Result from ui: $result');
    if (result == 'success') {
      nextScreenRemoveUntil(context, const ProductListPage());
      final snackbar = CustomAlerts.snackBar('Account Created Successfully');
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (result == 'email-already-in-use') {
      final snackbar = CustomAlerts.snackBar('Email already in use');
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (result == 'too-many-requests') {
      final snackBar =
          CustomAlerts.snackBar('Too many requests. Please try again later.');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
