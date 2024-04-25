import 'package:flutter/material.dart';

class QuenteFrio extends StatelessWidget {
  const QuenteFrio({
    super.key,
    required this.distance,
  });

  final double distance;

  @override
  Widget build(BuildContext context) {
    String message = '';

    //print("$distance metros distante");

    if (distance < 1) {
      message = "Está fervendo!";
    } else if (distance < 5) {
      message = "Está quente";
    } else if (distance < 10) {
      message = "Está frio";
    } else {
      message = "Está congelando";
    }

    return Text(
      message,
      style: const TextStyle(
        fontSize: 26.0,
        color: Colors.white,
      ),
    );
  }
}
