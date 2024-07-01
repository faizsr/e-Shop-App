import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:ecommerce_app/src/config/utils/gap.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/auth_helper_widget.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/custom_filled_button.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              CustomTextFormField(
                controller: nameController,
                validator: (val) {
                  return;
                },
                hintText: 'Name',
              ),
              gap(height: 20),
              CustomTextFormField(
                controller: emailController,
                validator: (val) {
                  return;
                },
                hintText: 'Email',
              ),
              gap(height: 20),
              CustomTextFormField(
                controller: emailController,
                validator: (val) {
                  return;
                },
                hintText: 'Password',
              ),
              const Spacer(),
              CustomFilledButton(
                onPressed: () {},
                btnText: 'Signup',
              ),
              gap(height: 12),
              AuthHelperWidget(
                text1: 'Already have an account? ',
                text2: 'Login',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
