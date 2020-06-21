import 'package:flutter/material.dart';
import 'dart:math' as math;

class CurvePainter extends StatefulWidget {
  @override
  _CurvePainterState createState() => _CurvePainterState();
}

class _CurvePainterState extends State<CurvePainter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: painter(),
      ),
    );
  }
}

class painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint();
    paint.color = Colors.pink;
    paint.strokeWidth = 1;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width / 2, size.height),
      paint,
    );

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(size.width , size.height/2),
      paint,
    );

    canvas.drawLine(
      Offset(size.width / 2, 0),
      Offset(0 , size.height/2),
      paint,
    );


    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width/4, paint);

    paint.style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(size.width/2,size.height/2+size.width/2),
        size.width/4,
        paint);
    canvas.drawCircle(
        Offset(size.width/2,size.height/2-size.width/8),
        size.width/8,
        paint);

    paint.color = Colors.green;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(size.width/2, size.height/2);
    path.lineTo(size.width/4, size.height/2);
    path.lineTo(size.width/2, size.height/2+size.width/4);

    // kare
    final left = 320.0;
    final top = 50.0;
    final right = 400.0;
    final bottom = 150.0;
    final rect = Rect.fromLTRB(left, top, right, bottom);
    canvas.drawRect(rect, paint);

    //Oval
    final rect0 = Rect.fromLTRB(140, 50, 270, 240);
    canvas.drawOval(rect0, paint);

    //Arc
    final rect02 = Rect.fromLTRB(250, 345, 400, 680);
    final startAngle = -math.pi / 2 ;
    final sweepAngle = math.pi ;
    canvas.drawArc(rect02, startAngle, sweepAngle, false, paint);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}