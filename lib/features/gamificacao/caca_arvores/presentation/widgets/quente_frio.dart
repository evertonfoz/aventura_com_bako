import 'package:aventura_com_bako/features/splashscreen/presentation/pages/startScreen.dart';
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

    if (distance < 1) {
      message = "Está fervendo!";
    } else if (distance < 5) {
      message = "Está quente";
    } else if (distance < 10) {
      message = "Está frio";
    } else {
      message = "Está congelando";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: const ShapeDecoration(
            color: Colors.yellow,
            shape: TooltipShapeBorder(
              arrowArc: 0.5,
              arrowHeight: 35,
            ),
            shadows: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(2, 2),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
              ),
            ),
          ),
        ),
        const Image(
          image: AssetImage('assets/Bako_1281x1423.png'),
          fit: BoxFit.fitWidth,
          height: 150,
        ),
      ],
    );
  }
}
