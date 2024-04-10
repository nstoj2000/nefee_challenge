import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const navyLight = Color(0xFF192841);
  static const navy = Color(0xFF151f34);
  static const teal = Color(0xFF01d5b0);
  static const grey = Color(0xFF556279);
  static const navyDark = Color(0xFF1e1e1e);
  static const buttonGradient = LinearGradient(
    colors: [
      Color(0xFF2c8fe0),
      Color(0xFF38d3b1),
    ],
  );
  static const gradient = LinearGradient(
    colors: [navy, navyDark],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
