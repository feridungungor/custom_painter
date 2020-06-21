import 'package:flutter/material.dart';
import 'package:fluttercustompainter/clock_view.dart';
import 'package:fluttercustompainter/curve_painter.dart';
import 'package:fluttercustompainter/face_outline.dart';
import 'package:fluttercustompainter/flower.dart';
import 'package:fluttercustompainter/wave_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Color(0XFF2D2F41),
          child: ClockView(),
//       child: CurvePainter(),
//        child: FaceOutline(),
//        child: Flowers(),
//        child: WaveAnimation(),
        ),
      ),
    );
  }
}
