import 'package:ecommerce/core/app_router.dart';
import 'package:ecommerce/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
    );
  }
}
