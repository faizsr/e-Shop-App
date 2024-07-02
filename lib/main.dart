import 'package:ecommerce_app/src/config/constants/app_colors.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:ecommerce_app/src/feature/auth/presentation/views/login/login_page.dart';
import 'package:ecommerce_app/src/feature/product/presentation/views/product_list/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.getIt<AuthController>(),
        )
      ],
      child: MaterialApp(
        title: 'Ecommerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: AppColors.lightWhite,
        ),
        home: FutureBuilder(
          future: di.getIt<AuthController>().userStatusUsecase.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return snapshot.data ?? false
                  ? const ProductListPage()
                  : const LoginPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
