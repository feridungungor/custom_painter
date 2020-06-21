import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child:CustomPaint(
        painter: ClockPainter(),
      )
    );
  }
}

class ClockPainter extends CustomPainter{
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width/2;
    double centerY = size.height/2;
    var center = Offset(centerX,centerY);
    double radius = min(centerX,centerY);

    var fillBrush = Paint()..color=Color(0XFF444974);
    var outlineBrush = Paint()
      ..color = Color(0XFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerFillBrush = Paint()..color = Color(0XFFEAECFF);

    var secHandBrush = Paint()
    ..color = Colors.orange[300]
    ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
    ..strokeWidth = 8;

    var minHandBrush = Paint()
    ..shader = RadialGradient(colors: [Color(0xFF748EF6),Color(0XFF77DDFF)])
      .createShader(Rect.fromCircle(center: center,radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0XFFEA74AB),Color(0XFFC279FB)])
          .createShader(Rect.fromCircle(center: center,radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    var dashBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0XFFEA74AB),Color(0XFFC279FB)])
          .createShader(Rect.fromCircle(center: center,radius: radius))
      ..strokeWidth = 2;

    canvas.drawCircle(center, radius-40, fillBrush);
    canvas.drawCircle(center, radius-40, outlineBrush);

    var hourHandX = centerX + 60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX + 60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX,hourHandY), hourHandBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX,minHandY), minHandBrush);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX,secHandY), secHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius-14;
    for(double i=0; i<360; i+=12){
      var x1 = centerX + outerCircleRadius * cos(i*pi/180);
      var y1 = centerX + outerCircleRadius * sin(i*pi/180);

      var x2 = centerX + innerCircleRadius * cos(i*pi/180);
      var y2 = centerX + innerCircleRadius * sin(i*pi/180);

      canvas.drawLine(Offset(x1,y1), Offset(x2,y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}