import 'dart:ui';

enum AppSize {
  textLarge,
  textMedium,
  textSmall;
}

class AppFontConfig {
  Size mediumSize = const Size(393, 852);
  double mediumFont = 16;

  double get fontLarge => mediumFont * screen.width / mediumSize.width + 2;
  double get fontMedium => mediumFont * screen.width / mediumSize.width;
  double get fontSmall => mediumFont * screen.width / mediumSize.width - 2;

  late Size screen;

  AppFontConfig();

}
