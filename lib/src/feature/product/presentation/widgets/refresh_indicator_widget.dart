// import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final Future Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      backgroundColor: AppColors.white,
      displacement: 10,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
