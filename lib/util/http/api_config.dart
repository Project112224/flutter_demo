import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../../models/get_it_model.dart';
import '../../util/extension.dart';
import '../app_config.dart';

class ApiConfig {
  String _domain = 'https';
  String _ip = 'www.themealdb.com';
  String _path = '/api/json/v1/1';

  late String path;

  Map<String, String> get headers => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  late HttpWithMiddleware _http;

  HttpWithMiddleware get http => _http;

  /// 初始化Dio
  void _initApi(AppEnvType buildType) {
    HttpOverrides.global = ReHttpOverrides();
    String baseUrl = '$_domain://$_ip$_path/';
    if (baseUrl.isEmpty || Uri.parse(baseUrl).host.isEmpty) return;
    debugPrint('⚠️ baseUrl: $baseUrl');
    path = baseUrl;
    try {
      Duration timeout = buildType.isRelease
          ? const Duration(seconds: 60)
          : const Duration(seconds: 60);

      _http = HttpWithMiddleware.build(
        requestTimeout: timeout,
        middlewares: buildType.isRelease ? [] : [HttpLogger(logLevel: LogLevel.BODY)],
      );

    } catch (err) {
      debugPrint('${toString()} - $err');
    }
  }

  /// 環境 - 本地
  void local({AppEnvType buildType = AppEnvType.local}) {
    // _domain = 'https';
    // _ip = '192.168.130.182';
    // _path = '/api/v1';
    _initApi(buildType);
  }

  /// 環境 - 使用者測試區
  void uat({AppEnvType buildType = AppEnvType.local}) {
    _domain = 'https';
    _ip = 'api.slingacademy.com';
    _path = '/v1/sample-data';
    _initApi(buildType);
  }

  /// 環境 - 系統測試區
  void sit({AppEnvType buildType = AppEnvType.local}) {
    _domain = 'https';
    _ip = 'api.slingacademy.com';
    _path = '/v1/sample-data';
    _initApi(buildType);
  }

  /// 環境 - 正式區
  void prod({AppEnvType buildType = AppEnvType.local}) {
    _domain = 'https';
    _ip = 'api.slingacademy.com';
    _path = '/v1/sample-data';
    _initApi(buildType);
  }

  /// 設定專案屬性
  void initEnv({AppEnvType buildType = AppEnvType.local}) {
    final apiI = getIt<ApiConfig>();
    switch (buildType) {
      case AppEnvType.local:
        apiI.local(buildType: buildType);
        break;
      case AppEnvType.uat:
        apiI.uat(buildType: buildType);
        break;
      case AppEnvType.sit:
        apiI.sit(buildType: buildType);
        break;
      case AppEnvType.prod:
        apiI.prod(buildType: buildType);
        break;
    }
  }
}