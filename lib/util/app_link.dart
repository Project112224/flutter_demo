import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

import 'router/router_provider.dart';
import 'router/page_name.dart';
import '../../models/get_it_model.dart';

class AppLinkHandler {
  appLinkInit(BuildContext context) async {
    AppLinkHandler.handleIncomingLinks(context);
    await AppLinkHandler.handleInitialUri(context);
  }

  static void handleIncomingLinks(BuildContext context) {
    uriLinkStream.listen(
      (Uri? uri) {
        if (uri != null) {
          try {
            path(context, uri);
          } catch (e) {
            debugPrint('⚠️AppLink - handleIncomingLinks error: $e');
          }
        }
      },
      onError: (Object err) {
        debugPrint('⚠️AppLink - handleIncomingLinks error: $err');
      },
    );
  }

  static Future handleInitialUri(BuildContext context) async {
    try {
      final uri = await getInitialUri();
      if (uri != null && context.mounted) {
        path(context, uri);
      }
      // ignore: empty_catches
    } on FormatException {}
  }

  static Future<bool> path(BuildContext context, Uri? uri) async {
    if (uri == null) return false;

    try {
      if (uri.path == '/home' && uri.queryParameters['id'] != null) {
        _home(context, uri);
        return true;
      }
    } catch (e) {
      debugPrint('⚠️AppLink - path error: $e');
    }

    return false;
  }

  static _home(BuildContext context, Uri uri) async {
    String id = uri.queryParameters['id'] ?? '';
    getIt<RouterProvider>().pushPage(
      PageName.homePage,
      context,
      blocQuery: {'id': id},
    );
  }
}
