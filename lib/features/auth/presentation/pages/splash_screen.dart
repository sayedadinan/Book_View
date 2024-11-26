import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/shared_preference.dart';
import 'package:books_app/features/auth/presentation/pages/login_screen.dart';
import 'package:books_app/features/books/presentation/pages/bottom_bar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    String? token = SharedPreferencesHelper.token;
    print('Token: $token');
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => token == null
                ? const LoginScreen()
                : const BottomBar()), // Replace with your next screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primaryColor,
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.gradient),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Logo.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
