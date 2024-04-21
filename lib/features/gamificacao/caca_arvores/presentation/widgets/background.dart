import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.white38, BlendMode.screen),
          fit: BoxFit.cover,
          image: AssetImage('assets/Padrão4.jpg'),
        ),
      ),
    );
  }
}
