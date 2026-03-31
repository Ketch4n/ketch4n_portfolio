import 'dart:math';

class Star {
  double x, y, z;
  double prevZ;

  Star()
    : x = (Random().nextDouble() - 0.5) * 2000,
      y = (Random().nextDouble() - 0.5) * 2000,
      z = Random().nextDouble() * 2000,
      prevZ = 0 {
    prevZ = z;
  }

  void update(double speed) {
    prevZ = z;
    z -= speed;
    if (z < 1) {
      z = 2000;
      prevZ = z;
    }
  }
}
