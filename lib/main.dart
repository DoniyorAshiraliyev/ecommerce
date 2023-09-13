import 'package:ecommerce/app.dart';
import 'package:ecommerce/core/service_locator.dart';
import 'package:ecommerce/services/db_service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlDatabase.init();
  await setupLocator();
  runApp(const ShopApp());
}
