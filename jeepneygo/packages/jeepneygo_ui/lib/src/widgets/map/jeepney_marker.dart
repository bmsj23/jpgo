import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Helper class to generate custom jeepney markers
class JeepneyMarkerGenerator {
  /// Generate a jeepney marker with heading indicator
  static Future<ui.Image> generateMarker({
    double size = 48,
    Color color = AppColors.primary,
    double heading = 0,
    bool showCapacity = false,
    int? currentPassengers,
    int? capacity,
  }) async {
    final pictureRecorder = ui.PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    final paint = Paint();

    final center = Offset(size / 2, size / 2);
    final radius = size / 2 - 4;

    // Draw shadow
    paint
      ..color = Colors.black.withOpacity(0.2)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    canvas.drawCircle(center.translate(0, 2), radius, paint);

    // Draw outer circle
    paint
      ..color = color
      ..maskFilter = null;
    canvas.drawCircle(center, radius, paint);

    // Draw inner circle (white)
    paint.color = AppColors.white;
    canvas.drawCircle(center, radius - 4, paint);

    // Draw jeepney icon (simplified bus shape)
    paint.color = color;
    final iconSize = size * 0.4;
    final iconRect = Rect.fromCenter(
      center: center,
      width: iconSize,
      height: iconSize * 0.7,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(iconRect, const Radius.circular(4)),
      paint,
    );

    // Draw heading indicator
    if (heading != 0) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(heading * math.pi / 180);

      final headingPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      final path = Path()
        ..moveTo(0, -radius - 2)
        ..lineTo(-6, -radius + 8)
        ..lineTo(6, -radius + 8)
        ..close();

      canvas.drawPath(path, headingPaint);
      canvas.restore();
    }

    // Draw capacity indicator
    if (showCapacity && currentPassengers != null && capacity != null) {
      final percentage = currentPassengers / capacity;
      Color capacityColor;
      if (percentage <= 0.5) {
        capacityColor = AppColors.capacityLow;
      } else if (percentage <= 0.8) {
        capacityColor = AppColors.capacityMedium;
      } else {
        capacityColor = AppColors.capacityHigh;
      }

      final capPaint = Paint()
        ..color = capacityColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round;

      const startAngle = -math.pi / 2;
      final sweepAngle = 2 * math.pi * percentage;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius + 2),
        startAngle,
        sweepAngle,
        false,
        capPaint,
      );
    }

    final picture = pictureRecorder.endRecording();
    return picture.toImage(size.toInt(), size.toInt());
  }
}
