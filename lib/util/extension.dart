import 'dart:io';

extension StringExtension on String {
  /// 刪除分號後所有字串
  String get removeSemicolon {
    int index = indexOf(';');
    if (index != -1) {
      return substring(0, index);
    }
    return this;
  }
}

class ReHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = ((X509Certificate cert, String host, int port) {
        final isValidHost = ['192.168.130.182'].contains(host);
        return isValidHost;
      });
  }
}