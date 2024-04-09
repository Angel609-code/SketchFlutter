import 'dart:math';

import 'package:flutter_processing/core/constants/noise_constants.dart';

class PerlinNoise {
  List<double> perlin = <double>[];

  double noise([double x = 0, double y = 0, double z = 0]) {
    if (perlin.isEmpty) {
      perlin = List<double>.filled(perlinSize + 1, 0);
      for (int i = 0; i < perlinSize + 1; i++) {
        perlin[i] = customRandom();
      }
    }

    final double modifiedX = x.abs();
    final double modifiedY = y.abs();
    final double modifiedZ = z.abs();

    int xi = modifiedX.floor();
    int yi = modifiedY.floor();
    int zi = modifiedZ.floor();

    double xf = modifiedX - xi;
    double yf = modifiedY - yi;
    double zf = modifiedZ - zi;

    double result = 0;
    double amplitude = 0.5;

    for (int octave = 0; octave < perlinOctaves; octave++) {
      int offset = xi + (yi << perlinYwrapb) + (zi << perlinZwrapb);
      final double rxf = scaledCosine(xf);
      final double ryf = scaledCosine(yf);

      double n1 = perlin[offset & perlinSize];
      double n2 = perlin[offset + perlinYwrap & perlinSize];

      n1 += rxf * (perlin[offset + 1 & perlinSize] - n1);
      n2 += rxf * (perlin[offset + perlinYwrap + 1 & perlinSize] - n2);

      n1 += ryf * (n2 - n1);

      offset += perlinZwrap;
      n2 = perlin[offset & perlinSize];
      n2 += rxf * (perlin[offset + 1 & perlinSize] - n2);

      double n3 = perlin[(offset + perlinYwrap) & perlinSize];
      n3 += rxf * (perlin[(offset + perlinYwrap + 1) & perlinSize] - n3);
      n2 += ryf * (n3 - n2);
      n1 += scaledCosine(zf) * (n2 - n1);
      result += n1 * amplitude;
      amplitude *= perlinAmpFalloff;
      xi <<= 1;
      xf *= 2;
      yi <<= 1;
      yf *= 2;
      zi <<= 1;
      zf *= 2;
      if (xf >= 1) {
        xi++;
        xf--;
      }
      if (yf >= 1) {
        yi++;
        yf--;
      }
      if (zf >= 1) {
        zi++;
        zf--;
      }
    }
    return result;
  }

  double scaledCosine(double i) => 0.5 * (1.0 - cos(i * pi));

  double customRandom() => Random().nextDouble();
}
