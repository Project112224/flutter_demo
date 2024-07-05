import 'package:flutter/material.dart';

mixin RouteMixin {
  /// [routeName] 路由名稱
  /// [blocQuery] 帶值至bloc
  /// [pushAndReplace] 是否要覆蓋當前路由，並重新pushPage一次
  /// [pushAndRemoveUntil] 一直pop至指定路由，並push新的[routeName]
  Future<T?> pushPage<T>(
    String routeName,
    BuildContext context, {
    Map<String, dynamic> blocQuery = const {},
    bool pushAndReplace = false,
    bool Function(String route)? pushAndRemoveUntil,
    PageRoute<T>? pageRoute,
  }) {
    var navigator = Navigator.of(context);
    if (pushAndRemoveUntil != null) {
      return navigator.pushNamedAndRemoveUntil(
        routeName,
        arguments: blocQuery,
        (rt) {
          bool check = pushAndRemoveUntil(rt.settings.name ?? "");
          debugPrint(
              'pushAndRemoveUntil 當前RouteName：${rt.settings.name} 是否Pop：${!check}');
          return check;
        },
      );
    } else if (pushAndReplace) {
      return navigator.pushReplacementNamed(routeName, arguments: blocQuery);
    } else {
      return navigator.pushNamed(routeName, arguments: blocQuery);
    }
  }

  /// [popUntil] 返回至指定頁
  /// [result] 返回值，[popUntil]為空才有效
  bool pop<T>(
    BuildContext context, {
    bool Function(String route)? popUntil,
    dynamic result,
  }) {
    var navigator = Navigator.of(context);

    if (popUntil != null) {
      navigator.popUntil((rt) {
        bool check = popUntil(rt.settings.name ?? "");

        if (!navigator.canPop()) {
          debugPrint('popUntil 已經無法再返回');
          return true;
        } else {
          return check;
        }
      });
      return true;
    } else {
      if (!navigator.canPop()) {
        debugPrint('canPop 已經無法再返回');
        return true;
      } else {
        navigator.pop();
        return false;
      }
    }
  }
}
