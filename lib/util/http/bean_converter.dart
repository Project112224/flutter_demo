import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_demo/bean/categories/category_bean.dart';

import '../../bean/search/search_bean.dart';

/// 轉換Bean
/// flutter pub run build_runner build --delete-conflicting-outputs
class BeanConverter {
  /// 轉化 [jsonString] 為 Bean
  /// <p>[onError] - 當轉化出現錯誤時呼叫</p>
  /// <p>[onError] 的 Function 參數可帶入以下兩種</p>
  /// - Function(dyanmic, Stacktrace) => 第一個參數為發生的錯誤, 第二個參數為 StackTrace
  /// - Function(dyanmic)
  static T convert<T>(
    String jsonString, {
    Function? onError,
  }) {
    return _convert<T>(
      jsonString,
      onError: onError,
    );
  }

  static T _convert<T>(
    String jsonString, {
    Function? onError,
  }) {
    late Map<String, dynamic> jsonConvert;
    try {
      jsonConvert = jsonDecode(jsonString);
    } catch (error, stack) {
      debugPrint("🛑BeanConverter 錯誤[json解析] - $jsonString");
      debugPrint("🛑BeanConverter 錯誤[json解析] - $error");
      debugPrint("🛑BeanConverter 錯誤[json解析] - $stack");
      handleError(onError, error, stack);
    }

    T? bean;

    /// 首先反序列化
    try {
      Function(Map<String, dynamic> jsonData)? convertFunc = _factories[T];
      if (convertFunc != null) {
        bean = convertFunc(jsonConvert);
      }
    } catch (error, stack) {
      debugPrint("🛑 BeanConverter 錯誤[反序列化 - $T] - $jsonString");
      debugPrint("🛑 BeanConverter 錯誤[反序列化 - $T] - $error");
      debugPrint("🛑 BeanConverter 錯誤[反序列化 - $T] - $stack");
      handleError(onError, error, stack);
    }

    /// 檢查反序列化後的結果, 若為 null 必定為尚未實現對應類別, 因為是使用 factory 初始化
    if (bean == null) {
      debugPrint(
          '🛑 BeanConverter 錯誤[null] - auto bean 尚未實現對應類別 ${StackTrace.current}');
      handleError(onError, TypeError(), StackTrace.current);
    }

    return bean!;
  }

  /// 發生錯誤之後跳入此處進行處理
  static void handleError(
      Function? onError, dynamic error, StackTrace stackTrace) {
    if (onError == null) {
      debugPrint("🛑 BeanConverter 錯誤: $error");
      throw error;
    } else {
      if (onError is Function(dynamic)) {
        onError(error);
      } else if (onError is Function(dynamic, StackTrace)) {
        onError(error, stackTrace);
      } else {
        debugPrint(
            "🛑 onError 格式錯誤: ${onError.runtimeType}, 須得是: Function(dyanmic, Stacktrace) 或 Function(dyanmic)");
        throw error;
      }
    }
  }

  BeanConverter._();
}

final _factories = <Type, Function(Map<String, dynamic> jsonData)?>{
  List<CategoryBean>: (jsonData) => (jsonData['categories'] as List<dynamic>)
      .map((e) => CategoryBean.fromJson(e))
      .toList(),
  List<SearchBean>: (jsonData) => (jsonData['meals'] as List<dynamic>)
      .map((e) => SearchBean.fromJson(e))
      .toList(),
};
