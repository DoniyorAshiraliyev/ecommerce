import 'package:ecommerce/core/service_locator.dart';
import 'package:ecommerce/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:ecommerce/presentation/screens/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return MainScreen();
        },
      )
    ],
  );
}
