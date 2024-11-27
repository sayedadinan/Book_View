import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      if (token == null) {
        // ignore: use_build_context_synchronously
        context.go('/auth');
      } else {
        // ignore: use_build_context_synchronously
        context.go('/home'); // Navigate to the BottomBar
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
