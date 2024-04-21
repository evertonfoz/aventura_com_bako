import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/background.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/resul_card.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/model/tree.dart';
import 'package:flutter/material.dart';

class ResultCacaPage extends StatefulWidget {
  const ResultCacaPage(
      {super.key, required this.tree, required this.isCorrect});

  final Tree tree;
  final bool isCorrect;

  @override
  State<ResultCacaPage> createState() => _ResultCacaPageState();
}

class _ResultCacaPageState extends State<ResultCacaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caça às Árvores'),
      ),
      body: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            const Background(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ResultCard(
                    tree: widget.tree,
                    isCorrect: widget.isCorrect,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
