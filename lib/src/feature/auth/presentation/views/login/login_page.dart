import 'package:ecommerce_app/src/feature/product/presentation/views/product_list/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:ecommerce_app/src/config/utils/gap.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/views/signup/signup_page.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              CustomTextFormField(
                controller: emailController,
                validator: (val) {
                  return;
                },
                hintText: 'Email',
              ),
              gap(height: 20),
              CustomTextFormField(
                controller: passwordController,
                validator: (val) {
                  return;
                },
                hintText: 'Password',
              ),
              const Spacer(),
              CustomFilledButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ProductListPage(),
                  ));
                },
                btnText: 'Login',
              ),
              gap(height: 12),
              AuthHelperWidget(
                text1: 'New here? ',
                text2: 'Signup',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
