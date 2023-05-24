import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:flutter/material.dart';

import '../widgets/caca_palavra.dart';

class HomeCacaPalavras extends StatelessWidget {
  HomeCacaPalavras({required this.user, required this.notifyParent, super.key});

  final Function() notifyParent;
  final GamificationUser user;

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
          CacaPalavra(user: user, notifyParent: notifyParent),
        ],
      ),
    );
  }
}
