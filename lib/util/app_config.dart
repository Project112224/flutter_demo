import 'package:flutter/foundation.dart';

import '../models/get_it_model.dart';
import 'http/api_config.dart';

enum AppEnvType {
  /// 本地
  local,

  /// 測試區
  uat,
  sit,

  /// 正式區
  prod;

  bool get isRelease => (this == AppEnvType.prod);

  static getType(String? envName) {
    if (envName == null) return AppEnvType.local;
    List<AppEnvType> types =
        AppEnvType.values.where((element) => element.name == envName).toList();
    if (types.isNotEmpty) {
      return types.first;
    }
    return AppEnvType.local;
  }
}

class AppConfig {

  late final AppEnvType buildType;

  initEnv() {
    String? env = const String.fromEnvironment('env');
    buildType = AppEnvType.getType(env);

    /// release not show print
    if (kReleaseMode || buildType.isRelease) {
      // empty debugPrint implementation in the release mode
      debugPrint = (String? message, {int? wrapWidth}) {};
    }

    /// set api
    getIt<ApiConfig>().initEnv(buildType: buildType);

    debugPrint('🟠build: $env');
  }
}
