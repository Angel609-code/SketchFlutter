import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_processing/core/extensions/noise.dart';
import 'package:flutter_processing/core/extensions/re_maps.dart';

abstract class SketchDefinition {
  // Setup and Draw
  void setup();
  void draw();
  void size(double width, double height) {
    canvasSize = Size(width, height);
    this.width = width;
    this.height = height;
  }

  // Color
  void background(Color color) {
    backgroundColor = color;
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final Rect rect = Offset.zero & canvasSize;
    if (canvas != null) {
      canvas!.drawRect(rect, paint);
    }
  }

  // fill
  VoidCallback fill(Color color) {
    fillColor = color;
    return () {};
  }

  // noFill
  void noFill() {
    fillColor = Colors.transparent;
  }

  // stroke
  VoidCallback stroke(Color color) {
    strokeColor = color;
    return () {};
  }

  // noStroke
  void noStroke() {
    strokeColor = Colors.transparent;
  }

  /// Shape
  // arc
  void arc(
    double x,
    double y,
    double width,
    double height,
    double startAngle,
    double endAngle,
  ) {
    final Paint paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.stroke;

    final Rect rect =
        Rect.fromCenter(center: Offset(x, y), width: width, height: height);
    if (canvas != null) {
      canvas!.drawArc(rect, startAngle, endAngle, false, paint);
    }
  }

  // ellipse
  void ellipse(double x, double y, double width, double height) {
    final Paint paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final Rect rect =
        Rect.fromCenter(center: Offset(x, y), width: width, height: height);
    if (canvas != null) {
      canvas!.drawOval(rect, paint);
    }
  }

  // circle
  void circle(double x, double y, double diameter) {
    final Paint paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final Offset center = Offset(x, y);
    if (canvas != null) {
      canvas!.drawCircle(center, diameter / 2, paint);
    }
  }

  // line
  void line(double x1, double y1, double x2, double y2) {
    final Paint paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.stroke;

    final Offset start = Offset(x1, y1);
    final Offset end = Offset(x2, y2);
    if (canvas != null) {
      canvas!.drawLine(start, end, paint);
    }
  }

  // point
  void point(double x, double y) {
    final Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = 1;

    final Offset point = Offset(x, y);
    if (canvas != null) {
      canvas!.drawPoints(PointMode.points, <Offset>[point], paint);
    }
  }

  /// Math
  // noise
  double noise([double x = 0, double y = 0, double t = 0]) {
    final PerlinNoise perlinNoise = PerlinNoise();
    return perlinNoise.noise(x, y, t);
  }

  // map
  double map(
    double value,
    double start1,
    double stop1,
    double start2,
    double stop2, {
    bool withinBounds = false,
  }) {
    final Remaps mapClass = Remaps();
    return mapClass.map(
      value,
      start1,
      stop1,
      start2,
      stop2,
      withinBounds: withinBounds,
    );
  }

  // structure
  // loop
  void loop() {
    loopActive = true;
  }

  // noLoop
  void noLoop() {
    loopActive = false;
  }

  Canvas? canvas;
  Size canvasSize = Size.infinite;
  Color backgroundColor = Colors.grey;
  Color fillColor = Colors.white;
  Color strokeColor = Colors.black;
  double width = double.infinity;
  double height = double.infinity;
  bool loopActive = true;
}
