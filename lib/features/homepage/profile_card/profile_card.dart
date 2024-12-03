import 'package:flutter/material.dart';
import 'package:goalfi/component/card.dart';
import '../domain/profile_card/user_profile_data.dart';

class ProfileCard extends StatelessWidget {
  final UserProfile userProfile;

  const ProfileCard({Key? key, required this.userProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RiskIndicator(value: userProfile.riskIndicator),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userProfile.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                userProfile.riskLevel,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                '${userProfile.age}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RiskIndicator extends StatelessWidget {
  final double value;

  const RiskIndicator({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(120, 120), // The size of the custom circle
            painter: CircularProgressPainter(
              progress: value,
              strokeWidth: 12, // Thickness of the circle
              backgroundColor: Colors.grey[200]!,
              progressColor: value > 0.7
                  ? Colors.red
                  : (value > 0.4 ? Colors.orange : Colors.green),
            ),
          ),
          Text(
            '${(value * 100).toInt()}%',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress; // Progress value between 0.0 and 1.0
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  CircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final double radius = (size.width / 2) - (strokeWidth / 2);
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Draw the background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the progress arc
    final double sweepAngle = 2 * 3.141592653589793 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2, // Start angle (top)
      sweepAngle,
      false, // Arc is not filled
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
