import 'dart:math';

import 'package:flutter/material.dart';
import '../main.dart';
import 'pergunta.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String resposta = '';
  late Pergunta perguntaAtual;
  int numeroTentativas = 0;
  final int maxTentativas = 2;

  @override
  void initState() {
    super.initState();
    carregarPergunta();
  }

  void carregarPergunta() {
    final random = Random();
    int index = random.nextInt(listaDePerguntas.length);
    Pergunta pergunta = listaDePerguntas[index];

    setState(() {
      perguntaAtual = Pergunta.fromShuffledOptions(pergunta);
      resposta = '';
      numeroTentativas = 0;
    });
  }

  void _onRetryPressed() {
    Navigator.pop(context); // Voltar para a página do quiz
    carregarPergunta(); // Recarregar uma nova pergunta
  }

  void verificarResposta(String opcaoSelecionada) {
    if (opcaoSelecionada == perguntaAtual.respostaCorreta) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ParabensPage()),
      ).then((_) {
        carregarPergunta();
      });
    } else {
      numeroTentativas++;
      if (numeroTentativas >= maxTentativas) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErroPage(onRetryPressed: _onRetryPressed),
          ),
        );
      } else {
        setState(() {
          resposta =
              'Incorreto! Tente novamente. Tentativas restantes: ${maxTentativas - numeroTentativas}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adivinha',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    perguntaAtual.imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        perguntaAtual.descricao,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Qual Planta é esta?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        verificarResposta(perguntaAtual.opcoesIncorretas[0]);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        backgroundColor: Colors.green,
                      ),
                      child: Text(perguntaAtual.opcoesIncorretas[0]),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        verificarResposta(perguntaAtual.opcoesIncorretas[1]);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        backgroundColor: Colors.green,
                      ),
                      child: Text(perguntaAtual.opcoesIncorretas[1]),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        verificarResposta(perguntaAtual.opcoesIncorretas[2]);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        backgroundColor: Colors.green,
                      ),
                      child: Text(perguntaAtual.opcoesIncorretas[2]),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        verificarResposta(perguntaAtual.opcoesIncorretas[3]);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        primary: Colors.green,
                      ),
                      child: Text(perguntaAtual.opcoesIncorretas[3]),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  resposta,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ParabensPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Parabéns!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Parabéns! Você acertou!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ErroPage extends StatelessWidget {
  final VoidCallback onRetryPressed;

  ErroPage({required this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Erro!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Você errou a questão.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRetryPressed,
              child: const Text('Tentar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
