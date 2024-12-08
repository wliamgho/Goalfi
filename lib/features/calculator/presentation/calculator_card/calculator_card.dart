import 'package:flutter/material.dart';
import 'package:goalfi/features/calculator/presentation/calculator.dart';
import 'package:goalfi/component/card.dart';

class CalculatorCard extends StatelessWidget {
  const CalculatorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CalculatorTab or any relevant page
        Navigator.pushNamed(
            context, '/calculator'); // Ensure this route is defined
      },
      child: ReusableCard(
        backgroundColor: Colors.green.shade100, // Optional card color
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calculate, // Calculator icon
              size: 48,
              color: Colors.green,
            ),
            SizedBox(height: 8),
            Text(
              'Investasi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
