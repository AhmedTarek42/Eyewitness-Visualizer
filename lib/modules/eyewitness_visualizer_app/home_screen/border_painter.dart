import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MiddleUpperBorderPainter extends CustomPainter {
  final Color color;

  MiddleUpperBorderPainter({required this.color,});


  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color// the border color here
      ..strokeWidth = 1.0; // the width of the colored area

    final double halfHeight = size.height / 2;
    final double middleWidth = size.width / 2;

    canvas.drawLine(
      Offset(middleWidth - 30, 0), // the position based on requirement
      Offset(middleWidth + 30, 0), // the position based on requirement
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}