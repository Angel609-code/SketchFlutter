import 'dart:math';

class Remaps {
  double map(
    double value,
    double start1,
    double stop1,
    double start2,
    double stop2, {
    bool withinBounds = false,
  }) {
    final double newValue =
        (value - start1) / (stop1 - start1) * (stop2 - start2) + start2;

    if (!withinBounds) {
      return newValue;
    }

    if (start2 < stop2) {
      return _constrain(newValue, start2, stop2);
    } else {
      return _constrain(newValue, stop2, start2);
    }
  }

  double _constrain(double value, double low, double high) => max(
        min(value, high),
        low,
      );
}
