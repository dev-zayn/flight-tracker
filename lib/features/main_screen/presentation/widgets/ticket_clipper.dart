import 'package:flutter/material.dart';

class CustomTicketShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(8)));
    path.addOval(Rect.fromCircle(
        center: Offset(0, (size.height / 3) * 1.8), radius: 15));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, (size.height / 3) * 1.8), radius: 15));
    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
