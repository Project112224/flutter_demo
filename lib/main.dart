import 'package:flutter/material.dart';

import 'app.dart';
import 'models/get_it_model.dart';
import 'util/app_config.dart';
import 'util/restart/restart_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// register get it
  await initLocator();

  await getIt<AppConfig>().initEnv();

  runApp(const RestartWidget(child: App()));
}