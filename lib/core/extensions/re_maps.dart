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

    if (withinBounds) {
      if (start2 < stop2) {
        if (newValue < start2) {
          return start2;
        } else if (newValue > stop2) {
          return stop2;
        }
      } else {
        if (newValue > start2) {
          return start2;
        } else if (newValue < stop2) {
          return stop2;
        }
      }
    }

    return newValue;
  }
}
