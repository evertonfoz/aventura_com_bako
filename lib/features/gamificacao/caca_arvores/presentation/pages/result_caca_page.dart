import 'package:aventura_com_bako/features/gamificacao/caca_arvores/channels/ble_scanner_channel.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/background.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/widgets/resul_card.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/model/tree.dart';
import 'package:flutter/material.dart';

class ResultCacaPage extends StatefulWidget {
  ResultCacaPage(
      {super.key,
      required this.tree,
      required this.isCorrect,
      required this.bleScanner,
      required this.trees});

  final Tree tree;
  final bool isCorrect;
  final BleScannerChannel bleScanner;
  final List<Tree> trees;

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
      body: Stack(
        children: [
          const Background(),
          Center(
            child: ResultCard(
              tree: widget.tree,
              isCorrect: widget.isCorrect,
              bleScanner: widget.bleScanner,
              trees: widget.trees,
            ),
          )
        ],
      ),
    );
  }
}
