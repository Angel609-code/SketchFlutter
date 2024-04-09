import 'dart:math' as math;
import 'package:flutter_processing/examples/imports.dart';

class SunflowerSketch extends SketchDefinition {
  SunflowerSketch({
    required this.maxSeeds,
    required this.seeds,
  });

  final int maxSeeds;
  final int seeds;

  @override
  void setup() {
    size(500, 450);
  }

  @override
  void draw() {
    background(const Color.fromARGB(255, 28, 29, 31));

    const int size = 200;
    const double circleSize = 5;
    const double tau = math.pi * 2;
    const double scaleFactor = 1 / 40;
    final double phi = (math.sqrt(5) + 1) / 2;

    fillColor(Colors.orange);
    for (int i = 0; i < seeds; i++) {
      final double theta = i * tau / phi;
      final double r = math.sqrt(i) * scaleFactor;
      final double x = r * math.cos(theta) * size + width / 2;
      final double y = -1 * r * math.sin(theta) * size + height / 2;
      circle(x, y, circleSize);
    }

    fillColor(Colors.grey.shade700);
    for (int j = seeds; j < maxSeeds; j++) {
      final double x = math.cos(tau * j / (maxSeeds - 1)) * size + width / 2;
      final double y = math.sin(tau * j / (maxSeeds - 1)) * size + height / 2;
      circle(x, y, circleSize);
    }
  }
}
