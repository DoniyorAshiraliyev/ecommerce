import 'package:dio/dio.dart';
import 'package:ecommerce/core/apis.dart';
import 'package:ecommerce/domain/repositories/product_repository.dart';
import 'package:ecommerce/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:ecommerce/services/db_service.dart';
import 'package:ecommerce/services/dio_service.dart';
import 'package:get_it/get_it.dart';


final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  /// network
  final dio = Dio();
  final networkService = DioService(dio: dio);

  locator.registerLazySingleton<Network>(() {
    networkService.configuration(Apis.baseUrl);
    return networkService;
  });

  /// database
  // final SqlDatabase database = SqlDatabase();
  // await database.init();
  // locator.registerLazySingleton<SqlDatabase>(() => database);
  locator.registerSingleton(SqlDatabase);


  //Repositories
  locator.registerSingleton<ProductRepository>(ProductRepositoryImpl(client: locator()));
  // Blocs
  locator.registerFactory(() => HomeBloc(locator()));
}