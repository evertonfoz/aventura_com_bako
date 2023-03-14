import 'package:flutter/material.dart';

Widget cabecalho(String titlePage, int placar, int chances) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
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
        const SizedBox(height: 6.0),
        Text(
          valor.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
