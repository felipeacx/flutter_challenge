import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  double _width = 0, _heigth = 0, _diagonal = 0;

  double get width => _width;
  double get heigth => _heigth;
  double get diagonal => _diagonal;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _width = size.width;
    _heigth = size.height;
    _diagonal =
        math.sqrt(math.pow(_width, 2) + math.sqrt(math.pow(_heigth, 2)));
  }

  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _heigth * percent / 100;
  double dp(double percent) => _diagonal * percent / 100;
}
