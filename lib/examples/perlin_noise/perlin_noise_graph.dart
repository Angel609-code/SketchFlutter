import 'package:flutter_processing/examples/imports.dart';

class PerlinNoiseGraph extends SketchDefinition {
  PerlinNoiseGraph();

  double inc = 0.01;
  double start = 0;

  @override
  void setup() {
    size(500, 450);
  }

  @override
  void draw() {
    background(const Color.fromARGB(255, 28, 29, 31));

    stroke(Colors.white);
    double xoff = start;
    for (double x = 0; x < width; x++) {
      final double y = noise(xoff) * height;
      point(x, y);
      xoff += inc;
    }

    start += inc;
  }
}
