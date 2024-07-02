import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:ecommerce_app/src/config/constants/app_textstyles.dart';
import 'package:ecommerce_app/src/config/utils/alerts.dart';
import 'package:ecommerce_app/src/config/utils/gap.dart';
import 'package:ecommerce_app/src/config/utils/navigates.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/views/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPageAppbar extends StatelessWidget {
  const ProductPageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    var appBarHeight = AppBar().preferredSize.height - 15;
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: AppColors.blue,
      title: Text(
        'e-Shop',
        style: AppTextStyles.primary(),
      ),
      actions: [
        PopupMenuButton(
          color: AppColors.white,
          elevation: 0,
          iconColor: AppColors.white,
          offset: Offset(-10.0, appBarHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: AppColors.blue, width: 1.5),
          ),
          itemBuilder: (ctx) => [
            _buildPopupMenuItem('Logout', CupertinoIcons.power, context),
          ],
        )
      ],
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      String title, IconData iconData, BuildContext context) {
    return PopupMenuItem(
      padding: EdgeInsets.zero,
      height: 25,
      onTap: () {
        nextScreenReplacement(context, const LoginPage());
        Provider.of<AuthController>(context, listen: false).signOut();
        final snackbar = CustomAlerts.snackBar('Sucessfully Logged Out');
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 22,
            color: AppColors.blue,
          ),
          gap(width: 10),
          Text(
            title,
            style: TextStyle(color: AppColors.blue),
          ),
        ],
      ),
    );
  }
}
