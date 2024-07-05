import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_cubit.dart';
import '../../bloc/detail/detail_bloc.dart';
import '../../bloc/start/start_cubit.dart';
import '../../page/detail/detail_page.dart';
import '../../page/home/home_page.dart';
import '../../page/start/start_page.dart';
import '../../util/router/page_name.dart';
import '../../util/router/route_mixin.dart';

typedef PageContentBuilder = Widget Function(RouteData? data);

class RouterProvider with RouteMixin {
  /// page_name.dart
  Map<String, PageContentBuilder> routes = {
    PageName.startPage: (_) => BlocProvider(
          child: const StartPage(),
          create: (_) => StartCubit(),
        ),
    PageName.homePage: (_) => BlocProvider(
          child: const HomePage(),
          create: (_) => HomeCubit(),
        ),
    PageName.detailPage: (data) => BlocProvider(
          child: const DetailPage(),
          create: (_) => DetailBloc(data),
        ),
  };

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final PageContentBuilder? pageContentBuilder = routes[settings.name];
    if (pageContentBuilder != null) {
      RouteData data = RouteData(
        settings.name ?? '',
        blocQuery: settings.arguments,
      );
      return MaterialPageRoute<Widget>(
        builder: (_) => pageContentBuilder(data),
      );
    }
    return null;
  }
}

class RouteData {
  /// 路由名稱
  String routeName;

  /// 傳入參數
  dynamic blocQuery;

  /// 是否加入歷史紀錄
  bool addHistory;

  RouteData(
    this.routeName, {
    this.blocQuery = const {},
    this.addHistory = true,
  });
}
