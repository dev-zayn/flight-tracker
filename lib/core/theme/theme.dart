import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: kcPrimary,
        // useMaterial3: true,
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(kcPrimary),
        ),
        primarySwatch: _materialColor,
        fontFamily: 'Roboto',
        splashColor: kcLightPrimary,
        // focusColor: Colors.transparent,
        // hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        brightness: Brightness.light,
        indicatorColor: kcPrimary,
        textTheme: _lightTextTheme,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: kcPrimary),
        appBarTheme: AppBarTheme(
          centerTitle: false,
          titleTextStyle: _titleLarge.copyWith(color: kcBlack),
          iconTheme: const IconThemeData(color: kcPrimary),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: _bodyMedium,
          ),
        ),
      );

  // light text theme
  static const TextTheme _lightTextTheme = TextTheme(
    bodyLarge: _bodyLarge,
    bodyMedium: _bodyMedium,
    bodySmall: _bodySmall,
    headlineLarge: _headlineLarge,
    headlineMedium: _headlineMedium,
    headlineSmall: _headlineSmall,
    displayLarge: _displayLarge,
    displayMedium: _displayMedium,
    displaySmall: _displaySmall,
    titleLarge: _titleLarge,
    titleMedium: _titleMedium,
    titleSmall: _titleSmall,
    labelLarge: _labelLarge,
    labelMedium: _labelMedium,
    labelSmall: _labelSmall,
  );

  // text styles
  static const TextStyle _headlineLarge = TextStyle(
    color: kcBlack,
    fontSize: 28,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
  );
  static const TextStyle _headlineMedium = TextStyle(
    color: kcBlack,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
  );
  static const TextStyle _headlineSmall = TextStyle(
    color: kcBlack,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
  );
  static const TextStyle _displayLarge = TextStyle(
    color: kcBlack,
    fontSize: 24,
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto",
  );
  static const TextStyle _displayMedium = TextStyle(
    color: kcBlack,
    fontSize: 22,
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto",
  );
  static const TextStyle _displaySmall = TextStyle(
    color: kcBlack,
    fontSize: 20,
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto",
  );
  static const TextStyle _bodyLarge = TextStyle(
    color: kcBlack,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
  );
  static const TextStyle _bodyMedium = TextStyle(
    color: kcBlack,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
  );
  static const TextStyle _bodySmall = TextStyle(
    color: kcBlack,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: "Roboto",
  );
  static const TextStyle _titleLarge = TextStyle(
    color: kcBlack,
    fontSize: 18,
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto",
  );
  static const TextStyle _titleMedium = TextStyle(
    color: kcBlack,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto",
  );
  static const TextStyle _titleSmall = TextStyle(
    color: kcBlack,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto",
  );
  static const TextStyle _labelLarge = TextStyle(
    color: kcBlack,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto",
  );
  static const TextStyle _labelMedium = TextStyle(
    color: kcBlack,
    fontSize: 10,
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto",
  );
  static const TextStyle _labelSmall = TextStyle(
    color: kcBlack,
    fontSize: 8,
    fontWeight: FontWeight.w300,
    fontFamily: "Roboto",
  );

  // for primary material color
  static const MaterialColor _materialColor = MaterialColor(
    0xff00A4E3,
    <int, Color>{
      50: kcPrimary,
      100: kcPrimary,
      200: kcPrimary,
      300: kcPrimary,
      400: kcPrimary,
      500: kcPrimary,
      600: kcPrimary,
      700: kcPrimary,
      800: kcPrimary,
      900: kcPrimary,
    },
  );
}
