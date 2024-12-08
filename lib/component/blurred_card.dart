import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goalfi/component/card.dart';

class BlurredCard extends StatelessWidget {
  final String message;

  const BlurredCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(16.0), // Matches ReusableCard styling
        child: Stack(
          children: [
            // Background blur effect
            BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Blur intensity
              child: Container(
                color:
                    Colors.black.withOpacity(0.1), // Semi-transparent overlay
              ),
            ),
            // Card content
            Align(
                alignment: Alignment.centerLeft, // Aligns content to the left
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.left, // Ensures text alignment is left
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
