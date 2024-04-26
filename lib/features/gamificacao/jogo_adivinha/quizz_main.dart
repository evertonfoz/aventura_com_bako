import 'package:aventura_com_bako/features/gamificacao/jogo_adivinha/widgets/tela_adivinha.dart';
import 'package:flutter/material.dart';
import './widgets/pergunta.dart';

class Adivinha extends StatelessWidget {
  const Adivinha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quizz',
        ),
      ),
      body: const Stack(children: [
        QuizzPage(),
      ]),
    );
  }
}

List<Pergunta> listaDePerguntas = obterListaDePerguntas();
