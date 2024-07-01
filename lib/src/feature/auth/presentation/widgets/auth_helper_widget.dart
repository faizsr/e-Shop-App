import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:flutter/material.dart';

class AuthHelperWidget extends StatelessWidget {
  const AuthHelperWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  final String text1;
  final String text2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: text1),
            TextSpan(
              text: text2,
              style: AppTextStyles.help(),
            )
          ],
        ),
      ),
    );
  }
}
