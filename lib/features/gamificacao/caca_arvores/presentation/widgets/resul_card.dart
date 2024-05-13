import 'package:aventura_com_bako/features/gamificacao/caca_arvores/channels/ble_scanner_channel.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/presentation/pages/caca_arvores_page.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_arvores/tree_shuffle/model/tree.dart';
import 'package:aventura_com_bako/features/splashscreen/presentation/pages/startScreen.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  ResultCard({
    super.key,
    required this.tree,
    required this.isCorrect,
    required this.bleScanner,
    required this.trees,
  });

  final Tree tree;
  final bool isCorrect;
  final BleScannerChannel bleScanner;
  List<Tree> trees;

  @override
  Widget build(BuildContext context) {
    String text = "Ah! Não é essa. Tente outra vez!";
    String button = "Tentar de novo";
    IconData image = Icons.close;

    if (isCorrect) {
      text = "Árvore ${tree.popularName} está correta!";
      image = Icons.done;
      button = "Procurar outra árvore";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isCorrect) infoTree(context),
        bakoMessage(text, context),
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green)),
          onPressed: () {
            returnPage(context);
          },
          child: Text(
            button,
            style: const TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget infoTree(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
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
                tree.popularName,
                style: const TextStyle(
                  fontSize: 32.0,
                  color: Colors.white,
                ),
              ),
              Text(
                tree.scienceName,
                style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 26.0,
                    color: Colors.white),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: Image(
                  image: tree.image!.image,
                  fit: BoxFit.contain,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget bakoMessage(message, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: const ShapeDecoration(
            color: Colors.yellow,
            shape: TooltipShapeBorder(
              arrowArc: 0.5,
              arrowHeight: 35,
            ),
            shadows: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                offset: Offset(2, 2),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
              ),
            ),
          ),
        ),
        const Image(
          image: AssetImage('assets/Bako_1281x1423.png'),
          fit: BoxFit.fitWidth,
          height: 250,
        ),
      ],
    );
  }

  void returnPage(context) {
    List<Tree> trees = List<Tree>.from(this.trees);

    if (isCorrect) {
      trees.add(tree);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CacaArvoresPage(
            trees: trees,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CacaArvoresPage(
            trees: trees,
            tree: tree,
          ),
        ),
      );
    }
  }
}
