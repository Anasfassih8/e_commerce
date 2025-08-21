import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = _generalTheme(isDark: false);

  static final darkTheme = _generalTheme(isDark: true);

  static ThemeData _generalTheme({required bool isDark}) {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDark ? AppColors.black : AppColors.whiteBackground,
      primaryColor: AppColors.primary,

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        hintStyle: TextStyle(fontSize: 14, color: isDark ? AppColors.white : AppColors.grey, fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: isDark ? AppColors.white : AppColors.grey), borderRadius: BorderRadius.circular(8)),
        disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: isDark ? AppColors.white.withAlpha(50) : AppColors.grey.withAlpha(50)), borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: AppColors.primary), borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.5, color: AppColors.red)),
        suffixIconColor: AppColors.grey,
        prefixIconColor: AppColors.grey,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style:
        //
        ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primary),
          //
          foregroundColor: WidgetStateProperty.all(AppColors.black),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              //
            ),
          ),
          textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}