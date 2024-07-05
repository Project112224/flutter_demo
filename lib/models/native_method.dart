import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class NativeMethod {
  static MethodChannel? _methodChannelInstance;

  static Future<MethodChannel> get _methodChannel async {
    final instance = _methodChannelInstance;
    if (instance != null) return instance;
    final packageInfo = await PackageInfo.fromPlatform();
    return _methodChannelInstance =
        MethodChannel('${packageInfo.packageName}.method_channel');
  }

  static Future<String> deviceID() async {
    final channel = await _methodChannel;
    return channel.invokeMethod('deviceID').then((value) => value ?? '');
  }

  static Future<bool> calendarEvent(String title, DateTime start, DateTime end,
      {String? location}) async {
    final channel = await _methodChannel;
    return channel.invokeMethod('calendarEvent', {
      'title': title,
      'start': start.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
      'location': location,
    }).then((value) => value ?? false);
  }

  static Future<bool> checkRoot() async {
    final channel = await _methodChannel;
    return channel.invokeMethod('isJailbreak').then((value) => value ?? false);
  }
}
