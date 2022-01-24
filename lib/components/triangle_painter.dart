import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final bool drawShadow;
  final Function(double, double) getPath;

  TrianglePainter(
      {required this.getPath, required this.drawShadow, this.color = Colors.black, this.strokeWidth = 3, this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    if (drawShadow) {
      canvas.drawShadow(getPath(size.width, size.height), Colors.grey.shade300, 5, false);
    }

    canvas.drawPath(getPath(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.paintingStyle != paintingStyle || oldDelegate.strokeWidth != strokeWidth;
  }
}
