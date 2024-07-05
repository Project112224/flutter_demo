import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../generated/intl/messages_en.dart';
import '../../generated/l10n.dart';
import '../../util/local_storage_keys.dart';

part 'start_state.dart';

class StartCubit extends Cubit<StartInitial> {
  StartCubit() : super(StartInitial());

  final storage = const FlutterSecureStorage();

  initSetting() async {
    /// 確認越獄
    bool jailBroken = await FlutterJailbreakDetection.jailbroken;
    if (jailBroken) {
      emit(state.copyWith(jailBroken: jailBroken));
      return;
    } else {
      await _initLanguage();
      emit(state.copyWith(isLoading: true));
    }
  }

  /// 設定多國語
  _initLanguage() async {
    final culture = await storage.read(key: LocalStorageKeys.appCultureInfo.name);
    const AppLocalizationDelegate()
        .load(Locale(culture ?? messages.localeName));
  }
}
