import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class WavePainter extends CustomPainter {
  const WavePainter({this.subtle = false});
  final bool subtle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.gold.withValues(alpha: subtle ? 0.045 : 0.055)
      ..style = PaintingStyle.stroke
      ..strokeWidth = subtle ? 1 : 1.2;
    final center = Offset(size.width * 0.62, size.height * 0.45);
    for (var i = 0; i < 9; i++) {
      final rect = Rect.fromCenter(
        center: center.translate(i * 4.0, i * 2.0),
        width: size.width * (0.82 + i * 0.045),
        height: size.height * (0.65 + i * 0.035),
      );
      canvas.drawOval(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant WavePainter oldDelegate) =>
      subtle != oldDelegate.subtle;
}
