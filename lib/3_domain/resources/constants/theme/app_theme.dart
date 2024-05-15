import 'package:flutter/material.dart';
import 'package:the_movie_database_front_end/3_domain/resources/colors/colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryDark,
        background: AppColors.backgroundDark,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: AppColors.inputBackgroundDark,
        filled: true,
        hoverColor: Colors.transparent,
        labelStyle: TextStyle(color: AppColors.inputLabelDark),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.inputBorderDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryDark),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(18)),
            foregroundColor: const MaterialStatePropertyAll(AppColors.white),
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.primaryDark),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 18))),
      ));
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
  );
}

enum ThemeType { dark, light, any }

extension ThemeTypeExtension on ThemeType {
  String get value => this == ThemeType.dark ? 'dark' : 'light';
  ThemeType fromString(String s) =>
      s == 'dark' ? ThemeType.dark : ThemeType.light;
}
