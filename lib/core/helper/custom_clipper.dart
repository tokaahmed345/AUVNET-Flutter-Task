
 import 'package:flutter/material.dart';

class CrescentTopLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double radiusBig = size.height * 0.7;
    final double radiusSmall = size.height * 0.6;

    Path bigCircle = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(radiusBig * 0.6, radiusBig * 0.6), 
        radius: radiusBig,
      ));

    Path smallCircle = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(radiusBig * 1.0, radiusBig * 1.0),
        radius: radiusSmall,
      ));

    Path crescent =
        Path.combine(PathOperation.difference, bigCircle, smallCircle);

    return crescent;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}