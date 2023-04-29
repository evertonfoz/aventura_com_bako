import 'package:flutter/material.dart';

class AlertGame extends StatelessWidget {
  const AlertGame({super.key, required this.pontos});
  final int pontos;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
  void alertWin(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Fechar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            )
          ],
          title: const Text(
            'Parabéns!!',
            style: TextStyle(
                fontSize: 20,
                decorationStyle: TextDecorationStyle.double,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                decorationColor: Colors.green),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('PARABENS VOCÊ'),
                Text('VOCE GANHOU MAIS $pontos SEMENTES !!!!!'),
              ],
            ),
          ),
        );
      },
    );
  }

  void alertTriesOver(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Fechar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            )
          ],
          title: const Text(
            'Que pena!!',
            style: TextStyle(
                fontSize: 20,
                decorationStyle: TextDecorationStyle.double,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                decorationColor: Colors.green),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Que pena!!'),
                Text(
                    'Suas tentaivas acabaram, mas continue buscando sementes para o bako!'),
              ],
            ),
          ),
        );
      },
    );
  }
}
