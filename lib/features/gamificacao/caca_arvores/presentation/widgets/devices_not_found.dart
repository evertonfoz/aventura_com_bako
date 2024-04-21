import 'package:flutter/material.dart';

class DevicesNotFound extends StatelessWidget {
  const DevicesNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 50.0),
        SizedBox(
          height: 200,
          width: 200,
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/games/caca_arvores/arvore_branca.png'),
                      fit: BoxFit.cover),
                )),
          ),
        ),
        const SizedBox(height: 30.0),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white60,
          ),
          child: const Column(
            children: [
              Text("Estou sorteando uma\n árvore para brincar!",
                  style: TextStyle(fontSize: 26.0)),
            ],
          ),
        )
      ],
    ));
  }
}
