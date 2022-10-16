import 'package:flutter/material.dart';

import '../widgets/caca_palavra.dart';

class HomeCacaPalavras extends StatelessWidget {
  const HomeCacaPalavras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caça-Palavras'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.white38, BlendMode.screen),
                    image: AssetImage('assets/Padrão4.jpg'),
                    fit: BoxFit.cover)),
          ),
          CacaPalavra(),
        ],
      ),
    );
  }
}