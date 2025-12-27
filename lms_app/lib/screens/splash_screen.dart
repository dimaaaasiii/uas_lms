import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'auth/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image Only
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset(
                'assets/images/logo_splash.png',
                fit: BoxFit.contain,
                width: 250, // Slightly larger for impact
              ),
            ),
          ],
        ),
      ),
    );
  }
}
