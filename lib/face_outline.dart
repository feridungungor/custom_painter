import 'package:flutter/material.dart';

class FaceOutline extends StatefulWidget {
  @override
  _FaceOutlineState createState() => _FaceOutlineState();
}

class _FaceOutlineState extends State<FaceOutline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: FaceOutlinePainter(),
      ),
    );
  }
}

class FaceOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.pink;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTRB(20, 40, 100, 100), Radius.circular(20)),
      paint,
    );

    canvas.drawOval(Rect.fromLTWH(size.width - 120, 40, 100, 100), paint);

    final mounth = Path();
    mounth.moveTo(size.width * 0.8, size.height * 0.6);

    mounth.arcToPoint(Offset(size.width * 0.2 , size.height * 0.6),
        radius: Radius.circular(150),clockwise: true);

    mounth.arcToPoint(Offset(size.width * 0.8, size.height * 0.6),
    radius: Radius.circular(200),clockwise: false);
    canvas.drawPath(mounth, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
