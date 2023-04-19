import 'package:flutter/material.dart';

Widget cabecalho(String titlePage, int placar, int chances) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _placar(placar),
        ],
      ),
    ],
  );
}

Widget _placar(int valor) {
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
