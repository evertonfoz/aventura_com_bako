import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_quizz/widgets/tela_adivinha.dart';
import 'package:flutter/material.dart';
import './widgets/pergunta.dart';

class Adivinha extends StatelessWidget {
  const Adivinha({super.key, required this.user, required this.notifyParent});
  final GamificationUser user;
  final Function notifyParent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quizz',
        ),
      ),
      body: Stack(children: [
        QuizzPage(notifyParent: notifyParent, user: user),
      ]),
    );
  }
}

List<Pergunta> listaDePerguntas = obterListaDePerguntas();
