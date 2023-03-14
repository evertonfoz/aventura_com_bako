import 'package:flutter/material.dart';

Widget cabecalho(String titlePage, int placar, int chances) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
            //height: 75,
            width: 350,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/games/caca_palavras/caca-palavras.png')),
              ),
            )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _placar('Sementes', placar),
        ],
      ),
    ],
  );
}

Widget _placar(String title, int valor) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      color: Colors.lime,
    ),
    child: Column(
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5.0),
        Text(
          valor.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
