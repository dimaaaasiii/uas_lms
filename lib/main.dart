import 'package:flutter/material.dart';
import 'package:lms/core/theme.dart';
import 'package:lms/screens/auth/login_page.dart';
import 'package:lms/screens/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LMS App',
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}


