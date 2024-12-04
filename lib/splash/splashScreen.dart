import 'dart:async';
import 'package:flutter/material.dart';
import 'package:goalfi/app/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key); // Added 'const' here

  @override
  Widget build(BuildContext context) {
    // Start the navigation logic after a short delay.
    Future.microtask(() => _checkInitialRoute(context));

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(), // Loading animation
            SizedBox(height: 20),
            Text(
              'Welcome to GoalFi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkInitialRoute(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    // Check if the user has already provided their data
    final String? name = prefs.getString('name');
    final int? age = prefs.getInt('age');

    if (name != null && age != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, AppRouter.mainTab);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, AppRouter.introQuestion);
      });
    }
  }
}
