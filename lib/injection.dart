import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:khedmaty/data/repository/Setting_Repo.dart';
import 'package:khedmaty/data/repository/auth_repo.dart';
import 'package:khedmaty/data/repository/myOrderRepo.dart';
import 'package:khedmaty/data/repository/products_Repo.dart';
import 'package:khedmaty/presentation/modules/auth/auth_view_model.dart';
import 'package:khedmaty/data/repository/home_Repo.dart';
import 'package:khedmaty/presentation/modules/layout/children/home/children/products/productsViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'core/network_info.dart';
import 'data/app_urls/app_url.dart';
import 'data/datasource/locale/database_provider.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/model/response/user_model.dart';
import 'data/repository/SaveUserData.dart';
import 'data/repository/orders_repo.dart';
import 'presentation/modules/layout/children/home/children/shoppingCard/shopping_cared_view_model.dart';
import 'presentation/modules/layout/children/home/homeViewModel.dart';
import 'presentation/modules/layout/children/my_orders/my_orders_view_model.dart';
import 'presentation/modules/layout/children/setting/settingViewModel.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// Core
  getIt.registerLazySingleton(() => NetworkInfo(getIt()));
  getIt.registerLazySingleton(() => DioClient(AppURL.kBaseURL, getIt(),
      loggingInterceptor: getIt(), sharedPreferences: getIt()));

  /// Providers
  getIt.registerLazySingleton(() => AuthViewModel());
  getIt.registerLazySingleton(() => HomeViewModel(homeRepo: getIt(), saveUserData: getIt(), productsRepo: getIt()));
  getIt.registerLazySingleton(() => ProductsViewModel(productsRepo: getIt(), saveUserData: getIt()));
  getIt.registerLazySingleton(() => SettingViewModel(saveUserData: getIt(), productsRepo: getIt(), settingRepo: getIt(),));
  getIt.registerLazySingleton(() => ShoppingCaredViewModel(ordersRepo: getIt(), saveUserData: getIt()));
  getIt.registerLazySingleton(() => CartProvider());
  getIt.registerLazySingleton(() => MyOrdersViewModel(myOrdersRepo: getIt()));

  /// Repository
  getIt.registerLazySingleton(() => SaveUserData(sharedPreferences: getIt(), dioClient: getIt()));
  getIt.registerLazySingleton(() => AuthRepo(dioClient: getIt(), saveUserData: getIt()));
  getIt.registerLazySingleton(() => HomeRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => ProductsRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => SettingRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => MyOrdersRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => OrdersRepo(saveUserData: getIt(), dioClient: getIt()));
//  getIt.registerLazySingleton(() => SaveUserData(sharedPreferences: getIt(), dioClient: getIt()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton(() => UserModel());
  getIt.registerLazySingleton(() => Connectivity());
}
