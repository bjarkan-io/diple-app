import 'package:flutter/material.dart';

class Diple {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: DipleColors.dipleWhite,
      accentColor: DipleColors.limeGreen,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      accentColor: DipleColors.limeGreen,
      canvasColor: Colors.black,
    );
  }

  static Color getCardColor(BuildContext context) {
    switch (Theme.of(context).brightness) {
      case Brightness.dark:
        return DipleColors.dipleBlack;
      default:
        return DipleColors.dipleWhite;
    }
  }

  static Color getTextColor(BuildContext context) {
    switch (Theme.of(context).brightness) {
      case Brightness.dark:
        return DipleColors.dipleWhite;
      default:
        return DipleColors.dipleDark;
    }
  }
}

class DipleColors {
  static final Color limeGreen = Color(0xff38d39f);
  static final Color lightGreen = Color(0xff76ffd0);
  static final Color darkGreen = Color(0xff00a170);
  static final Color dipleWhite = Color(0xffffffff);
  static final Color dipleDark = Color(0xff333333);
  static final Color dipleBlack = Color(0xff111111);

  static final Color gradientLightStop = lightGreen;
  static final Color gradientDarkStop = limeGreen;

  static final LinearGradient darkGradient = LinearGradient(colors: [
    gradientLightStop,
    gradientDarkStop,
  ]);
}
