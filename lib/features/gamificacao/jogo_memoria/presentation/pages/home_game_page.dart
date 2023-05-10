import 'package:aventura_com_bako/features/gamificacao/alert_game.dart';
import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/data/model/game_model.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/informacoes_jogo_da_memoria/presentation/controller/jogoMemoria_controller.dart';
import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/informacoes_jogo_da_memoria/presentation/pages/Informacoes_memoria_page.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/score_board.dart';

class HomePageMemoryGame extends StatefulWidget {
  HomePageMemoryGame(
      {required this.isEasy,
      required this.user,
      required this.notifyParent,
      Key? key})
      : super(key: key);
  GamificationUser user;
  final Function() notifyParent;
  bool isEasy;

  @override
  State<HomePageMemoryGame> createState() => _HomePageMemoryGameState();
}

class _HomePageMemoryGameState extends State<HomePageMemoryGame> {
  InformacoesJogoDaMemoriaController controller =
      Get.put(InformacoesJogoDaMemoriaController());

  int tentativasEasy = 15;
  int tentativasHard = 25;
  final MemoryGameModelEasy _gameModelEasy = MemoryGameModelEasy();
  final MemoryGameModelHard _gameModelHard = MemoryGameModelHard();

  int pontos = 0;
  int previousIndex = -1;
  bool flip = false;

  @override
  void initState() {
    controller.getAllInformacoesJogoDaMemoria();
    super.initState();
    _gameModelEasy.cardFlips.every((element) => element = true);
    _gameModelEasy.initGame();
    _gameModelHard.cardFlips.every((element) => element = true);
    _gameModelHard.initGame();
  }

  _isEasy(isEasy) {
    if (isEasy) {
      return _gameModelEasy;
    } else {
      return _gameModelHard;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memorizando com Bako'),
      ),
      body: Stack(
        children: [
          _backgroundPage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cabecalho('MEMORY', widget.user.pontuacao,
                  widget.isEasy ? tentativasEasy : tentativasHard),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.57,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: _gridCards(context),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _faceConfigFlipCard(Color cor, String? image) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(8.0),
          image: image!.isNotEmpty
              ? (DecorationImage(image: AssetImage(image), fit: BoxFit.cover))
              : null),
    );
  }

  Widget _gridCards(context) {
    return GridView.builder(
      itemCount: _isEasy(widget.isEasy).gameImg!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.isEasy ? 3 : 4,
        crossAxisSpacing: widget.isEasy ? 16.0 : 8,
        mainAxisSpacing: 16.0,
      ),
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, index) {
        return FlipCard(
          key: _isEasy(widget.isEasy).cardStateKeys[index],
          onFlip: () {
            logicMatch(index, context);
          },
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: _isEasy(widget.isEasy).cardFlips[index],
          front: _faceConfigFlipCard(Colors.green, 'assets/hidden.png'),
          back: _faceConfigFlipCard(
              Colors.white, _isEasy(widget.isEasy).shuffleCardsList![index]),
        );
      },
    );
  }

  Widget _backgroundPage() {
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

  void logicMatch(index, context) {
    if (!flip) {
      flip = true;
      previousIndex = index;
    } else {
      flip = false;
      if (previousIndex != index) {
        if (_isEasy(widget.isEasy).shuffleCardsList![previousIndex] !=
            _isEasy(widget.isEasy).shuffleCardsList![index]) {
          _isEasy(widget.isEasy)
              .cardStateKeys[previousIndex]
              .currentState!
              .toggleCard();
          previousIndex = index;
          setState(() {
            if (widget.isEasy) {
              tentativasEasy -= 1;
            } else {
              tentativasHard -= 1;
            }
          });
          if (tentativasEasy == 0 || tentativasHard == 0) {
            AlertGame(pontos: pontos).alertTriesOver(context);
          }
        } else {
          _isEasy(widget.isEasy).cardFlips[previousIndex] = false;
          _isEasy(widget.isEasy).cardFlips[index] = false;
          setState(() {
            pontos += 5;
            widget.user.pontuacao += 5;
            widget.notifyParent();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InformacoesMemoriaPage(
                        controller: controller, index: findIndex(index))));
          });
          if (_isEasy(widget.isEasy).cardFlips.every((t) => t == false)) {
            //widget.gamification.updatePontuacao(pontos);
            AlertGame(pontos: pontos).alertWin(context);
          }
        }
      } else {
        setState(() {
          if (widget.isEasy) {
            tentativasEasy -= 1;
          } else {
            tentativasHard -= 1;
          }
        });
      }
    }
  }

  int findIndex(int index) {
    int numOfInf;
    int numInicial;
    if (widget.isEasy) {
      numInicial = 0;
      numOfInf = 6;
    } else {
      numInicial = 6;
      numOfInf = 16;
    }
    for (var i = numInicial; i < numOfInf; i++) {
      if (_isEasy(widget.isEasy).shuffleCardsList![index] ==
          _isEasy(widget.isEasy).cardsList[i]) {
        return i;
      }
    }
    return -1;
  }
}
