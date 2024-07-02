import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:ecommerce_app/src/config/utils/validations.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(builder: (context, value, child) {
      return CustomTextFormField(
        controller: passwordController,
        validator: validatePasswordLogin,
        hintText: 'Password',
        obscureText: value.isObscure,
        suffixWidget: InkWell(
          onTap: () {
            Provider.of<AuthController>(context, listen: false)
                .togglePassword();
          },
          child: Consumer<AuthController>(builder: (context, value, child) {
            return Icon(
              value.isObscure
                  ? CupertinoIcons.eye_slash_fill
                  : CupertinoIcons.eye_fill,
              size: 20,
              color: AppColors.blueGray.withOpacity(1),
            );
          }),
        ),
      );
    });
  }
}
