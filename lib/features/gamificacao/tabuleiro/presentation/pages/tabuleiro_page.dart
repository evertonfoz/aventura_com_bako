import 'dart:math';

import 'package:aventura_com_bako/features/gamificacao/tabuleiro/presentation/controller/tabuleiroController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../gamification_model.dart';

class TabuleiroPage extends StatefulWidget {
  TabuleiroPage({super.key, required this.notifyParent, required this.user});
  GamificationUser user;
  final Function() notifyParent;

  @override
  State<TabuleiroPage> createState() => _TabuleiroPageState();
}

class _TabuleiroPageState extends State<TabuleiroPage> {
  InformacoesTabuleiroController controller =
      Get.put(InformacoesTabuleiroController());

  int pos = 0;
  int? dice;
  var gridState = [
    {'gridPos': 0, 'decoration': true, 'mapPos': '🌳'},
    {'gridPos': 1, 'decoration': true, 'mapPos': '🌱'},
    {'gridPos': 2},
    {'gridPos': 3, 'index': 15, 'mapPos': 'FIM'},
    {'gridPos': 4, 'index': 11, 'mapPos': '11'},
    {'gridPos': 5, 'index': 12, 'mapPos': '12'},
    {'gridPos': 6, 'index': 13, 'mapPos': '13'},
    {'gridPos': 7, 'index': 14, 'mapPos': '14'},
    {'gridPos': 8, 'index': 10, 'mapPos': '10'},
    {'gridPos': 9},
    {'gridPos': 10, 'decoration': true, 'mapPos': '🌳'},
    {'gridPos': 11},
    {'gridPos': 12, 'index': 9, 'mapPos': '9'},
    {'gridPos': 13, 'index': 8, 'mapPos': '8'},
    {'gridPos': 14, 'index': 7, 'mapPos': '7'},
    {'gridPos': 15, 'index': 6, 'mapPos': '6'},
    {'gridPos': 16, 'decoration': true, 'mapPos': '🌳'},
    {'gridPos': 17},
    {'gridPos': 18, 'decoration': true, 'mapPos': '🐕'},
    {'gridPos': 19, 'index': 5, 'mapPos': '5'},
    {'gridPos': 20, 'index': 1, 'mapPos': '1'},
    {'gridPos': 21, 'index': 2, 'mapPos': '2'},
    {'gridPos': 22, 'index': 3, 'mapPos': '3'},
    {'gridPos': 23, 'index': 4, 'mapPos': '4'},
    {'gridPos': 24, 'index': 0, 'mapPos': 'INICIO'},
    {'gridPos': 25, 'decoration': true, 'mapPos': '🌳'},
    {'gridPos': 26},
    {'gridPos': 27, 'decoration': true, 'mapPos': '🦋'},
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
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.74,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    border: Border.all(color: Colors.brown, width: 2.0)),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, index) {
                    return _buildGridItems(context, index);
                  },
                  itemCount: gridStateLength,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 650),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("$pos"),
                Text("${dice ?? '0'}"),
                FloatingActionButton(
                    child: const Icon(Icons.crop_square),
                    onPressed: () {
                      setState(() {
                        dice = Random().nextInt(6) + 1;
                        pos = pos + dice!;
                        if (pos >= 15) {
                          pos = 15;
                          _finalDialog();
                        } else {
                          _informacaoDialog(pos - 1);
                        }
                      });
                    })
              ],
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

  _informacaoDialog(int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('${controller.informacoesTabuleiroList[index].titulo}'),
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
    int gridStateLength = gridState.length;
    return GridTile(
      child: Container(
        child: Center(
          child: _buildGridItem(index),
        ),
      ),
    );
  }

  _buildGridItem(int index) {
    if (pos == gridState[index]["index"]) {
      return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.orange, width: 1)),
          child: Center(
            child: Image.asset('assets/Bako_1281x1423.png'),
          ));
    } else if (gridState[index]['decoration'] == true) {
      return Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Text(
              "${gridState[index]['mapPos']}",
              style: TextStyle(fontSize: 50),
            ),
          ));
    } else if (gridState[index]["index"] == null) {
      return Container();
    } else {
      return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.orangeAccent,
              border: Border.all(color: Colors.orange, width: 1)),
          child: Center(
            child: Text("${gridState[index]['mapPos']}"),
          ));
    }
  }
}
