import 'dart:math';

import '../model/angleFormat.dart';

double angleToRadians(double value, AngleFormat angleFormat) {
  switch (angleFormat) {
    case AngleFormat.radians:
      break;
    case AngleFormat.cycles:
      value = value * 2 * pi;
      break;
    case AngleFormat.degree:
      value = (value / 360) * 2 * pi;
      break;
  }
  return value;
}
