// import 'dart:math' as math;
import 'package:flutter_processing/examples/imports.dart';

class PerlinNoise1 extends SketchDefinition {
  PerlinNoise1();

  double xoff = 0;
  double yoff = 10000;

  @override
  void setup() {
    size(500, 450);
  }

  @override
  void draw() {
    background(const Color.fromARGB(255, 28, 29, 31));

    final double x = map(noise(xoff), 0, 1, 0, width, withinBounds: true);
    final double y = map(noise(yoff), 0, 1, 0, height, withinBounds: true);

    xoff += 0.01;
    yoff += 0.01;

    circle(x, y, 24);
  }
}
