import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Diple {
  static ColorScheme lightScheme = ColorScheme(
    primary: DipleColors.limeGreen,
    primaryVariant: DipleColors.darkGreen,
    onPrimary: DipleColors.dipleWhite,
    secondary: DipleColors.dipleWhite,
    secondaryVariant: DipleColors.dipleWhite,
    onSecondary: DipleColors.dipleDark,
    surface: DipleColors.dipleWhite,
    onSurface: DipleColors.dipleDark,
    background: DipleColors.dipleWhite,
    onBackground: DipleColors.dipleDark,
    error: DipleColors.errorRed,
    onError: DipleColors.dipleWhite,
    brightness: Brightness.light,
  );

  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: DipleColors.dipleWhite,
      accentColor: DipleColors.limeGreen,
      colorScheme: lightScheme,
      textTheme: GoogleFonts.mavenProTextTheme(),
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
        colorScheme: lightScheme,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        labelStyle: TextStyle(
          color: DipleColors.dipleDark,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: DipleColors.limeGreen),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      textTheme: GoogleFonts.mavenProTextTheme(),
      brightness: Brightness.dark,
      accentColor: DipleColors.limeGreen,
      canvasColor: Colors.black,
      buttonTheme: ButtonThemeData(
        buttonColor: DipleColors.dipleWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
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
  static final Color errorRed = Colors.red;

  static final Color gradientLightStop = lightGreen;
  static final Color gradientDarkStop = limeGreen;

  static final LinearGradient darkGradient = LinearGradient(colors: [
    gradientLightStop,
    gradientDarkStop,
  ]);
}
