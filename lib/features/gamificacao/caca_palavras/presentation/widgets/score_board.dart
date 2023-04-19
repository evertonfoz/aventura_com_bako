import 'package:flutter/material.dart';

Widget cabecalho(String titlePage, int placar, int chances) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Padding(
        padding: EdgeInsets.all(10.0),
        child: SizedBox(
          //height: 75,
          width: 350,
        ),
      ),
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

  // return Container(
  //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20.0),
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.circular(6.0),
  //     color: Colors.lime,
  //   ),
  //   child: Column(
  //     children: [
  //       Text(
  //         title.toUpperCase(),
  //         style: const TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(height: 5.0),
  //       Text(
  //         valor.toString(),
  //         style: const TextStyle(fontWeight: FontWeight.bold),
  //       ),
  //     ],
  //   ),
  // );
}
