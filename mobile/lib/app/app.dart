import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../features/splash/view/splash_screen.dart';

class VyronaApp extends StatelessWidget {
  const VyronaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vyrona',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: const SplashScreen(),
    );
  }
}
