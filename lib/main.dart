import 'package:flutter/material.dart';

import 'gradient_color_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: GradientColorContainer(
        Color.fromARGB(255, 49, 16, 107),
        Color.fromARGB(255, 115, 69, 196),
      ),
    ),
  ));
}
