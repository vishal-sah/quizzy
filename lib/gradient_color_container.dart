import 'package:flutter/material.dart';
import 'homepage.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientColorContainer extends StatelessWidget {
  const GradientColorContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: HomePage()
      ),
    );
  }
}
