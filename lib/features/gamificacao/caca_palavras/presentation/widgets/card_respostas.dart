import 'package:aventura_com_bako/features/gamificacao/caca_palavras/data/model/resposta.dart';
import 'package:flutter/material.dart';

class CardResposta extends StatefulWidget {
  CardResposta({required this.toFind, super.key});
  ValueNotifier<List<RespostasCacaPalavra>> toFind;

  @override
  State<CardResposta> createState() => _CardRespostaState();
}

class _CardRespostaState extends State<CardResposta> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.lime,
      ),
      child: ValueListenableBuilder(
        valueListenable: widget.toFind,
        builder: (context, List<RespostasCacaPalavra> value, child) {
          // lets make custom widget using Column & Row

          // how many row child we want show per row?
          int perColTotal = 2;

          // generate using list.generate
          List<Widget> list = List.generate(
              (value.length ~/ perColTotal) +
                  ((value.length % perColTotal) > 0 ? 1 : 0), (int index) {
            int maxColumn = (index + 1) * perColTotal;

            return Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    maxColumn > value.length
                        ? maxColumn - value.length
                        : perColTotal, ((indexChild) {
                  // forgot to declare array for access answerList
                  int indexArray = (index) * perColTotal + indexChild;

                  return Text(
                    // make text more clearly to read
                    value[indexArray].wsLocation.word.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: value[indexArray].done ? Colors.red : Colors.black,
                      decoration: value[indexArray].done
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  );
                })).toList(),
              ),
            );
          }).toList();

          return Column(
            children: list,
          );
        },
      ),
    );
  }
}
