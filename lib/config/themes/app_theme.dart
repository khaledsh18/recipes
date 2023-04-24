import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipes/core/utils/colors.dart';

ThemeData appTheme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primaryColor,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      textTheme: TextTheme(
          bodyMedium: TextStyle(color: AppColors.white),
          bodyLarge: TextStyle(color: AppColors.black),
          titleLarge: TextStyle(color: AppColors.primaryColor)),
          textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.primaryColor),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
      ));
}
