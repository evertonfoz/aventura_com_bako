import 'package:flutter/material.dart';
import './widgets/pergunta.dart';
import './widgets/quiz.dart';

main() {
  runApp(const Adivinha());
}

class Adivinha extends StatelessWidget {
  const Adivinha({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

List<Pergunta> listaDePerguntas = obterListaDePerguntas();
