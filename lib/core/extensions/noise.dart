import 'dart:math';

import 'package:flutter_processing/core/constants/noise_constants.dart';

class PerlinNoise {
  List<double> perlin = List<double>.filled(perlinSize + 1, 0);

  double noise([double x = 0, double y = 0, double z = 0]) {
    if (perlin[0] == 0) {
      for (int i = 0; i < perlinSize + 1; i++) {
        perlin[i] = Random().nextDouble();
      }
    }
    double modifiedX = x;
    double modifiedY = y;
    double modifiedZ = z;
    if (x < 0) {
      modifiedX = -x;
    }
    if (y < 0) {
      modifiedY = -y;
    }
    if (z < 0) {
      modifiedZ = -z;
    }
    int xi = modifiedX.floor();
    int yi = modifiedY.floor();
    int zi = modifiedZ.floor();
    double xf = modifiedX - xi;
    double yf = modifiedY - yi;
    double zf = modifiedZ - zi;
    double r = 0;
    double ampl = 0.5;
    for (int o = 0; o < perlinOctaves; o++) {
      int of = xi + (yi << perlinYwrapb) + (zi << perlinZwrapb);
      final double rxf = scaledCosine(xf);
      final double ryf = scaledCosine(yf);
      double n1 = perlin[of & perlinSize];
      n1 += rxf * (perlin[(of + 1) & perlinSize] - n1);
      double n2 = perlin[(of + perlinYwrap) & perlinSize];
      n2 += rxf * (perlin[(of + perlinYwrap + 1) & perlinSize] - n2);
      n1 += ryf * (n2 - n1);
      of += perlinZwrap;
      n2 = perlin[of & perlinSize];
      n2 += rxf * (perlin[(of + 1) & perlinSize] - n2);
      double n3 = perlin[(of + perlinYwrap) & perlinSize];
      n3 += rxf * (perlin[(of + perlinYwrap + 1) & perlinSize] - n3);
      n2 += ryf * (n3 - n2);
      n1 += scaledCosine(zf) * (n2 - n1);
      r += n1 * ampl;
      ampl *= perlinAmpFalloff;
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
    return r;
  }

  double scaledCosine(double i) => 0.5 * (1.0 - cos(i * pi));
}
