import 'dart:async';
import 'package:flutter/material.dart';
import 'package:goalfi/app/routes/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key); // Added 'const' here

  @override
  Widget build(BuildContext context) {
    // Start the navigation logic after a short delay.
    Future.microtask(() => _navigateToInitialRoute(context));

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

  void _navigateToInitialRoute(BuildContext context) {
    // Simulate a delay and navigate to the initial route
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, AppRouter.mainTab);
    // });
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRouter.mainTab);
    });
  }
}
