import 'dart:math';
import 'package:flutter/material.dart';

class Flowers extends StatefulWidget {
  @override
  _FlowersState createState() => _FlowersState();
}

class _FlowersState extends State<Flowers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: FlowerPainter(),
      ),
    );
  }
}

class FlowerPainter extends CustomPainter{

  Paint green_paint = Paint()..color = Color(0xff00ff00);
  Paint yellow_paint = Paint()..color = Color(0xffebe834);
  Paint white_paint = Paint()..color = Color(0xffFFFFFF);

  @override
  void paint(Canvas canvas, Size size) {

    int petals_count = 20;
    canvas.translate(100,200);
/*
    canvas.save();
    canvas.translate(100, 150);
    canvas.rotate(135 * pi / 180);
    Rect leaf1 = Rect.fromLTWH(0, 0, 25, 25);
    canvas.drawRect(leaf1, green_paint);
    canvas.restore();

    // Draw rotated leaf
    canvas.save();
    canvas.translate(160, 150);
    canvas.rotate(90 * pi / 180);
    leaf1 = Rect.fromLTWH(0, 0, 35, 35);
    canvas.drawRect(leaf1, green_paint);
    canvas.restore();
*/
    // Draw petals
    canvas.save();
    canvas.translate(100, 0);

    Rect petal = Rect.fromLTWH(0, 0, 40, 40);
    for (int i = 0; i < petals_count; i++) {
      canvas.save();
      canvas.rotate((360.0 * i / petals_count) * pi / 180);
      canvas.drawRect(petal, yellow_paint);
      canvas.restore();
    }



    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
