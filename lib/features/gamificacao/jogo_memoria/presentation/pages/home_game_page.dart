import 'package:aventura_com_bako/features/gamificacao/jogo_memoria/data/model/game_model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../widgets/score_board.dart';

class HomeGamePage extends StatefulWidget {
  const HomeGamePage({Key? key}) : super(key: key);

  @override
  State<HomeGamePage> createState() => _HomeGamePageState();
}

class _HomeGamePageState extends State<HomeGamePage> {
  int tentativas = 20;
  int placar = 0;
  final MemoryGameModel _gameModel = MemoryGameModel();

  int previousIndex = -1;
  bool flip = false;

  @override
  void initState() {
    super.initState();
    _gameModel.initGame();
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
              cabecalho('MEMORY', placar, tentativas),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 325,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: _gridCards(),
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

  Widget _gridCards() {
    return GridView.builder(
      itemCount: _gameModel.gameImg!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 16.0,
      ),
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, index) {
        return FlipCard(
          key: _gameModel.cardStateKeys[index],
          onFlip: () {
            logicMatch(index);
          },
          direction: FlipDirection.HORIZONTAL,
          flipOnTouch: _gameModel.cardFlips[index],
          front: _faceConfigFlipCard(
              Colors.amber, 'assets/images/launch_screen.png'),
          back: _faceConfigFlipCard(Colors.white, _gameModel.cardsList[index]),
        );
      },
    );
  }

  Widget _backgroundPage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/Padrão4.jpg'),
        ),
      ),
    );
  }

  void logicMatch(index) {
    if (!flip) {
      flip = true;
      previousIndex = index;
    } else {
      flip = false;
      if (previousIndex != index) {
        if (_gameModel.cardsList[previousIndex] !=
            _gameModel.cardsList[index]) {
          _gameModel.cardStateKeys[previousIndex].currentState!.toggleCard();
          previousIndex = index;
          setState(() {
            tentativas -= 1;
          });
        } else {
          _gameModel.cardFlips[previousIndex] = false;
          _gameModel.cardFlips[index] = false;
          setState(() {
            placar += 100;
          });
          if (_gameModel.cardFlips.every((t) => t == false)) {
            print("Fazer um trem de alert");
          }
        }
      } else {
        setState(() {
          tentativas -= 1;
        });
      }
    }
  }
}
