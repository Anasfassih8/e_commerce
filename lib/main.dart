import 'package:e_commerce/core/theme/app_themes.dart';
import 'package:e_commerce/core/managers/theme_manager.dart';
import 'package:e_commerce/presentation/features/auth/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();
BuildContext get appContext => appKey.currentContext!;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeManager.themeNotifier,
      builder:
          (context, value, child) => MaterialApp(
            title: 'ecommerce app',
            theme: AppThemes.lightTheme,

            darkTheme: AppThemes.darkTheme,
            themeMode: value,

            home: LoginScreen(),
            navigatorKey: appKey,
          ),
    );
  }
}