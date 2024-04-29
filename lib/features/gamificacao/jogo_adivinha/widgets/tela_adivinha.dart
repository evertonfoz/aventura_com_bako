import 'dart:math';

import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/mapa/presentation/page/welcome_page.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import '../quizz_main.dart';
import 'pergunta.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key, required this.user, required this.notifyParent});

  final GamificationUser user;
  final Function notifyParent;

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
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
      _showDialog(true).then((_) {
        widget.user.updatePontuacao(perguntaAtual.recompensa);
        widget.notifyParent();
        carregarPergunta();
      });
    } else {
      numeroTentativas++;
      if (numeroTentativas >= maxTentativas) {
        _showDialog(false).then((_) {
          _onRetryPressed();
        });
      } else {
        setState(() {
          resposta =
              'Incorreto! Tente novamente. Tentativas restantes: ${maxTentativas - numeroTentativas}';
        });
      }
    }
  }

  _showDialog(bool isRight) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(isRight ? 'Correto!' : 'Que Pena!',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    isRight ? 'Parabéns!' : 'Boa Sorte na proxima!.',
                    textAlign: TextAlign.center,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Você ganhou: ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: isRight ? '${perguntaAtual.recompensa}' : '0',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )),
                        const TextSpan(text: ' sementes'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.amber),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        isRight ? 'Jogar Novamente' : 'Retornar',
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            backgroundColor: Colors.amber),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    perguntaAtual.imagePath,
                  ),
                  fit: BoxFit.fitHeight,
                ),
                color: Colors.transparent,
              ),
            ),
            Visibility(
              visible: perguntaAtual.descricao.isNotEmpty,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.33),
                child: Column(
                  children: [
                    Container(
                      decoration: const ShapeDecoration(
                        color: Color.fromARGB(255, 255, 244, 145),
                        shape:
                            TooltipShapeBorder(arrowArc: 0.5, arrowHeight: 20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Text(
                                  perguntaAtual.descricao,
                                  style: TextStyle(
                                    color: Color(
                                      ColorUtils.hexToInt("#94BF36"),
                                    ),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const Divider(),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          verificarResposta(perguntaAtual
                                              .opcoesIncorretas[0]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(24),
                                        ),
                                        child: Text(
                                            perguntaAtual.opcoesIncorretas[0]),
                                      ),
                                      const SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          verificarResposta(perguntaAtual
                                              .opcoesIncorretas[1]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(24),
                                        ),
                                        child: Text(
                                            perguntaAtual.opcoesIncorretas[1]),
                                      ),
                                      const SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          verificarResposta(perguntaAtual
                                              .opcoesIncorretas[2]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(24),
                                        ),
                                        child: Text(
                                            perguntaAtual.opcoesIncorretas[2]),
                                      ),
                                      const SizedBox(height: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          verificarResposta(perguntaAtual
                                              .opcoesIncorretas[3]);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(24),
                                        ),
                                        child: Text(
                                            perguntaAtual.opcoesIncorretas[3]),
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
                      ),
                    ),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    'assets/Bako_1281x1423.png'), //TODO Constantes
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
