import 'package:aventura_com_bako/features/gamificacao/gamification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aventura_com_bako/features/loja/data/ItensLoja.dart';

class LojaScreen extends StatefulWidget {
  LojaScreen({super.key, required this.user});

  GamificationUser user;

  @override
  State<LojaScreen> createState() => _LojaScreenState();
}

class _LojaScreenState extends State<LojaScreen> {
  _canBuy(int price) {
    if (price >= widget.user.pontuacao) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  Future<bool?> _alertCantBuy() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          elevation: 8,
          title: Text(
            'Você não possui sementes o suficiente!',
            style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Row(
            children: [
              Container(
                width: 70.00,
                height: 70.00,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/Bako.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Se deseja comprar esse item, jogue os jogos para conseguir mais sementes!',
                  style: TextStyle(
                    color: Colors.green[900],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Colors.amber),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Voltar',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      backgroundColor: Colors.amber),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loja")),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image:
                      ExactAssetImage('assets/Padrão4.jpg'), //TODO Constantes
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.user.userName.toString()),
                  ),
                ),
                _placar(widget.user.pontuacao),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1,
                horizontal: 0),
            child: CupertinoScrollbar(
              thickness: 8,
              radiusWhileDragging: const Radius.circular(10),
              scrollbarOrientation: ScrollbarOrientation.right,
              radius: const Radius.circular(20),
              child: GridView.builder(
                itemCount: itensLoja.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      RawMaterialButton(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(itensLoja[index].asset),
                                fit: BoxFit.fill),
                            color: Colors.green,
                            border: Border.all(
                                color: itensLoja[index].active
                                    ? Colors.lightGreen
                                    : Colors.red,
                                style: BorderStyle.solid,
                                width: 5),
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                offset: Offset(2, 2),
                                color: Colors.black87,
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                              )
                            ],
                          ),
                        ),
                        onPressed: () {
                          if (!itensLoja[index].active) {
                            if (itensLoja[index].price <=
                                widget.user.pontuacao) {
                              setState(() {
                                widget.user.pontuacao = widget.user.pontuacao -
                                    itensLoja[index].price;
                                itensLoja[index].active = true;
                              });
                            } else {
                              _alertCantBuy();
                            }
                          }
                        },
                      ),
                      Text(itensLoja[index].title),
                      Text(
                        "Preço: ${itensLoja[index].price} sementes",
                        style:
                            TextStyle(color: _canBuy(itensLoja[index].price)),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _placar(valor) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(5),
    width: 100,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white60,
    ),
    child: Column(
      children: [
        const Text('Sementes:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/saco-de-sementes.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              valor.toString(),
              overflow: TextOverflow.fade,
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
