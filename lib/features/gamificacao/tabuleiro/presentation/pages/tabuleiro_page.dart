import 'dart:async';
import 'dart:math';

import 'package:aventura_com_bako/features/audio/controller/audioController.dart';
import 'package:aventura_com_bako/features/gamificacao/tabuleiro/presentation/controller/tabuleiroController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gamification_model.dart';

class TabuleiroPage extends StatefulWidget {
  const TabuleiroPage(
      {super.key,
      required this.notifyParent,
      required this.user,
      required this.audioController});
  final GamificationUser user;
  final Function() notifyParent;
  final AudioController audioController;

  @override
  State<TabuleiroPage> createState() => _TabuleiroPageState();
}

class _TabuleiroPageState extends State<TabuleiroPage> {
  InformacoesTabuleiroController controller =
      Get.put(InformacoesTabuleiroController());

  int pos = 0;
  int dice = 0;
  int diceImageIndex = 0;
  int counter = 1;
  int bakoAnimation = 0;

  List<String> diceImage = [
    'assets/games/dice1.png',
    'assets/games/dice2.png',
    'assets/games/dice3.png',
    'assets/games/dice4.png',
    'assets/games/dice5.png',
    'assets/games/dice6.png',
  ];

  var gridState = [
    {
      'gridPos': 0,
      'decoration': true,
      'mapPos': 'assets/images/borboleta2.png'
    },
    {'gridPos': 1, 'decoration': true, 'mapPos': 'assets/images/arvore1.png'},
    {'gridPos': 2, 'decoration': true, 'mapPos': 'assets/images/arvore2.png'},
    {'gridPos': 3, 'index': 15, 'mapPos': 'FIM'},
    {'gridPos': 4, 'index': 11, 'mapPos': '11'},
    {'gridPos': 5, 'index': 12, 'mapPos': '12'},
    {'gridPos': 6, 'index': 13, 'mapPos': '13'},
    {'gridPos': 7, 'index': 14, 'mapPos': '14'},
    {'gridPos': 8, 'index': 10, 'mapPos': '10'},
    {'gridPos': 9, 'decoration': true, 'mapPos': 'assets/images/arvore2.png'},
    {'gridPos': 10, 'decoration': true, 'mapPos': 'assets/images/arbusto3.png'},
    {'gridPos': 11, 'decoration': true, 'mapPos': 'assets/images/arvore2.png'},
    {'gridPos': 12, 'index': 9, 'mapPos': '9'},
    {'gridPos': 13, 'index': 8, 'mapPos': '8'},
    {'gridPos': 14, 'index': 7, 'mapPos': '7'},
    {'gridPos': 15, 'index': 6, 'mapPos': '6'},
    {'gridPos': 16, 'decoration': true, 'mapPos': 'assets/images/arvore2.png'},
    {'gridPos': 17, 'decoration': true, 'mapPos': 'assets/images/arvore1.png'},
    {'gridPos': 18, 'decoration': true, 'mapPos': 'assets/images/bananao.png'},
    {'gridPos': 19, 'index': 5, 'mapPos': '5'},
    {'gridPos': 20, 'index': 1, 'mapPos': '1'},
    {'gridPos': 21, 'index': 2, 'mapPos': '2'},
    {'gridPos': 22, 'index': 3, 'mapPos': '3'},
    {'gridPos': 23, 'index': 4, 'mapPos': '4'},
    {'gridPos': 24, 'index': 0, 'mapPos': '↑'},
    {'gridPos': 25, 'decoration': true, 'mapPos': 'assets/images/arvore2.png'},
    {'gridPos': 26, 'decoration': true, 'mapPos': 'assets/images/arbusto3.png'},
    {'gridPos': 27, 'decoration': true, 'mapPos': 'assets/images/pedra1.png'},
  ];

  @override
  void initState() {
    controller.getAllInformacoesTabuleiro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int gridStateLength = gridState.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabuleiro'),
      ),
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image(
                image: AssetImage('assets/images/fundinho.png'),
                fit: BoxFit.fill),
          ),
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, index) {
                    return _buildGridItems(context, index);
                  },
                  itemCount: gridStateLength,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.7),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.brown,
                        style: BorderStyle.solid,
                        width: 5),
                    color: const Color.fromARGB(255, 186, 140, 99),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        iconSize: MediaQuery.of(context).size.height * 0.1,
                        icon: Image.asset(
                          diceImage[diceImageIndex],
                        ),
                        onPressed: () async {
                          widget.audioController.playDiceAudio();
                          Timer.periodic(const Duration(milliseconds: 100),
                              (timer) {
                            counter++;
                            setState(() {
                              diceImageIndex = Random().nextInt(6);
                            });
                            if (counter >= 13) {
                              timer.cancel();
                              setState(() {
                                counter = 1;
                              });
                            }
                          });
                          await Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              dice = diceImageIndex + 1;
                              Timer.periodic(const Duration(milliseconds: 500),
                                  (timer) {
                                setState(() {
                                  bakoAnimation++;
                                  pos++;
                                });
                                if (bakoAnimation == dice || pos >= 15) {
                                  bakoAnimation = 0;
                                  timer.cancel();
                                  if (pos >= 15) {
                                    pos = 15;
                                    _finalDialog();
                                  } else {
                                    _informacaoDialog(pos - 1);
                                  }
                                }
                              });
                            });
                          });
                        })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _finalDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Parabéns!'),
            actions: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.amber),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Sair',
                        style: TextStyle(
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

  _resultAction(int index) {
    Future.delayed(const Duration(seconds: 2));
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        bakoAnimation++;
        if (controller.informacoesTabuleiroList[index].value!.isNegative) {
          pos--;
        } else {
          pos++;
        }
        if (bakoAnimation ==
            controller.informacoesTabuleiroList[index].value!.abs()) {
          bakoAnimation = 0;
          timer.cancel();
        }
      });
    });
  }

  _informacaoDialog(int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('${controller.informacoesTabuleiroList[index].result}'),
            content:
                Text('${controller.informacoesTabuleiroList[index].texto}'),
            actions: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (controller.informacoesTabuleiroList[index].value !=
                          0) {
                        _resultAction(index);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        backgroundColor: Colors.amber),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Role novamente!',
                        style: TextStyle(
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

  _buildGridItems(BuildContext context, int index) {
    return GridTile(
      child: Center(
        child: _buildGridItem(index),
      ),
    );
  }

  _buildGridItem(int index) {
    if (gridState[index]['decoration'] == true) {
      return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image(
            image: AssetImage("${gridState[index]['mapPos']}"),
            fit: BoxFit.fill,
          ));
    } else if (gridState[index]["index"] == null) {
      return Container();
    } else {
      return Stack(
        children: [
          Image(
            image: _pathgenerator(index),
            fit: BoxFit.cover,
          ),
          _bakoPos(index),
        ],
      );
    }
  }

  _bakoPos(int index) {
    if (pos == gridState[index]["index"]) {
      return Center(
        child: Image.asset('assets/Bako_1281x1423.png'),
      );
    } else {
      return Center(
        child: Stack(
          children: [
            Text(
              "${gridState[index]['mapPos']}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 35,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
              ),
            ),
            Text(
              "${gridState[index]['mapPos']}",
              overflow: TextOverflow.visible,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
  }

  _pathgenerator(int index) {
    if (index % 2 == 0) {
      return const AssetImage('assets/images/caminho_teste1.png');
    } else {
      return const AssetImage('assets/images/caminho_teste2.png');
    }
  }
}
