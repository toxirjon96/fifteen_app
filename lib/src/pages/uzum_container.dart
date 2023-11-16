import 'package:flutter/material.dart';

class UzumContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final paint = Paint()..color = Colors.red..strokeWidth = 2;
    final path = Path()..quadraticBezierTo(w / 2, 0, w, h / 4);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
