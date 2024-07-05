import 'package:get_it/get_it.dart';

import '../../util/app_font_config.dart';
import '../util/app_config.dart';
import '../util/app_link.dart';
import '../util/http/api_config.dart';
import '../util/http/app_repository/app_repository.dart';
import '../util/router/router_provider.dart';

final getIt = GetIt.I;

Future initLocator() async {
  getIt.registerLazySingleton<RouterProvider>(() => RouterProvider());
  getIt.registerLazySingleton<AppConfig>(() => AppConfig());
  getIt.registerLazySingleton<ApiConfig>(() => ApiConfig());
  getIt.registerLazySingleton<AppRepository>(() => AppRepository());
  getIt.registerLazySingleton<AppLinkHandler>(() => AppLinkHandler());
  getIt.registerLazySingleton<AppFontConfig>(() => AppFontConfig());
}