import 'package:flutter/material.dart';
import 'package:recipes/config/routes/app_routes.dart';
import 'package:recipes/config/themes/app_theme.dart';
import 'package:recipes/core/utils/strings.dart';

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}