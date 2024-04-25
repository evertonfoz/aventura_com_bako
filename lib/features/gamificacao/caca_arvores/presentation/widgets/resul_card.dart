import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/model/tree.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.tree,
    required this.isCorrect,
  });

  final Tree tree;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    String text = 'Ah! Não é essa. Tente outra vez!';
    IconData image = Icons.close;

    if (isCorrect) {
      text = "Árvore ${tree.popularName} está correta!";
      image = Icons.done;
    }

    return SizedBox(
      width: 400,
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(1.0),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                ),
              ),
              Icon(
                image,
                size: 200,
                color: Colors.white,
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
