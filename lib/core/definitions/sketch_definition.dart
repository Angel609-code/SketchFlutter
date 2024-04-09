import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:flutter_processing/core/extensions/noise.dart';
import 'package:flutter_processing/core/extensions/re_maps.dart';

abstract class SketchDefinition {
  void setup();
  void draw();
  void size(double width, double height) {
    canvasSize = Size(width, height);
    this.width = width;
    this.height = height;
  }

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

  VoidCallback fillColor(Color color) {
    fillerColor = color;
    return () {};
  }

  void circle(double x, double y, double diameter) {
    final Paint paint = Paint()
      ..color = fillerColor
      ..style = PaintingStyle.fill;

    final Offset center = Offset(x, y);
    if (canvas != null) {
      canvas!.drawCircle(center, diameter / 2, paint);
    }
  }

  // ignore: prefer_expression_function_bodies
  double noise([double x = 0, double y = 0, double t = 0]) {
    // final PerlinNoise perlinNoise = PerlinNoise();
    // return perlinNoise.noise(x, y, t);
    return js.context.callMethod('eval', <dynamic>['p5.prototype.noise($x)']);
  }

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

  Canvas? canvas;
  Size canvasSize = Size.infinite;
  Color backgroundColor = Colors.grey;
  Color fillerColor = Colors.white;
  double width = double.infinity;
  double height = double.infinity;
}
