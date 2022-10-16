import 'package:aventura_com_bako/features/gamificacao/caca_palavras/data/model/current_obj.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_palavras/data/model/resposta.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_palavras/presentation/widgets/card_respostas.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_palavras/presentation/widgets/score_board.dart';
import 'package:flutter/material.dart';
import 'package:word_search_safety/word_search_safety.dart';

class CacaPalavra extends StatefulWidget {
  CacaPalavra({Key? key}) : super(key: key);

  @override
  _CacaPalavraState createState() => _CacaPalavraState();
}

class _CacaPalavraState extends State<CacaPalavra> {
  int numBox = 11;
  double padding = 5;
  int placarJogo = 0;
  Size sizeBox = Size.zero;
  late ValueNotifier<List<List<String>>> listaPalavras;
  late ValueNotifier<List<RespostasCacaPalavra>> listaResposta;
  late ValueNotifier<CurrentObj> currentClick;
  late ValueNotifier<List<int>> palavrasFeitas;

  @override
  void initState() {
    super.initState();
    listaPalavras = ValueNotifier<List<List<String>>>([]);
    listaResposta = ValueNotifier<List<RespostasCacaPalavra>>([]);
    currentClick = ValueNotifier<CurrentObj>(CurrentObj(Offset.zero, [],
        indexArrayTouch: null, currentToque: Offset.zero));
    palavrasFeitas = ValueNotifier<List<int>>(<int>[]);
    geradorRandomicoPalavras();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        cabecalho('Caça-Palavras', placarJogo, 0),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green.shade700, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          width: 380,
          height: 380,
          padding: EdgeInsets.all(padding),
          margin: EdgeInsets.all(padding),
          child: areaJogavel(),
        ),
        const SizedBox(height: 35),
        Container(
          alignment: Alignment.center,
          child: CardResposta(
            toFind: listaResposta,
          ),
        ),
      ],
    );
  }

  void endClick(PointerUpEvent? event) {
    if (currentClick.value.currentLine == null) return;

    currentClick.value.currentLine.clear();
    currentClick.notifyListeners();
  }

  void updateClick(PointerMoveEvent event) {
    generateLineOnDrag(event);

    int indexFound = listaResposta.value.indexWhere((answer) {
      return answer.answerLines!.join("-") ==
          currentClick.value.currentLine.join("-");
    });

    if (indexFound >= 0) {
      listaResposta.value[indexFound].done = true;
      palavrasFeitas.value.addAll(listaResposta.value[indexFound].answerLines!);
      setState(() {
        placarJogo += 10;
      });
      palavrasFeitas.notifyListeners();
      listaResposta.notifyListeners();
      endClick(null);
    }
  }

  int calculateIndexBasePosLocal(Offset localPosition) {
    double maxSizeBox = ((sizeBox.width - (numBox - 1) * padding) / numBox);

    if (localPosition.dy > sizeBox.width || localPosition.dx > sizeBox.width) {
      return -1;
    }

    int x = 0, y = 0;
    double yAxis = 0, xAxis = 0;
    double yAxisStart = 0, xAxisStart = 0;

    for (var i = 0; i < numBox; i++) {
      xAxisStart = xAxis;
      xAxis +=
          maxSizeBox + (i == 0 || i == (numBox - 1) ? padding / 2 : padding);

      if (xAxisStart < localPosition.dx && xAxis > localPosition.dx) {
        x = i;
        break;
      }
    }

    for (var i = 0; i < numBox; i++) {
      yAxisStart = yAxis;
      yAxis +=
          maxSizeBox + (i == 0 || i == (numBox - 1) ? padding / 2 : padding);

      if (yAxisStart < localPosition.dy && yAxis > localPosition.dy) {
        y = i;
        break;
      }
    }

    return y * numBox + x;
  }

  void generateLineOnDrag(PointerMoveEvent event) {
    // ignore: prefer_conditional_assignment
    if (currentClick.value.currentLine == null) {
      currentClick.value.currentLine = <int>[];
    }

    int indexBase = calculateIndexBasePosLocal(event.localPosition);

    if (indexBase >= 0) {
      if (currentClick.value.currentLine.length >= 2) {
        late WSOrientation wsOrientation;

        if (currentClick.value.currentLine[0] % numBox ==
            currentClick.value.currentLine[1] % numBox) {
          wsOrientation = WSOrientation.vertical;
        } else if (currentClick.value.currentLine[0] ~/ numBox ==
            currentClick.value.currentLine[1] ~/ numBox) {
          wsOrientation = WSOrientation.horizontal;
        }

        if (wsOrientation == WSOrientation.horizontal) {
          if (indexBase ~/ numBox !=
              currentClick.value.currentLine[1] ~/ numBox) {
            endClick(null);
          }
        } else if (wsOrientation == WSOrientation.vertical) {
          if (indexBase % numBox !=
              currentClick.value.currentLine[1] % numBox) {
            endClick(null);
          }
        } else {
          endClick(null);
        }
      }

      if (!currentClick.value.currentLine.contains(indexBase)) {
        currentClick.value.currentLine.add(indexBase);
      } else if (currentClick.value.currentLine.length >= 2) {
        if (currentClick
                .value.currentLine[currentClick.value.currentLine.length - 2] ==
            indexBase) {
          endClick(null);
        }
      }
    }
    currentClick.notifyListeners();
  }

  void startClick(int indexArray) {
    try {
      List<RespostasCacaPalavra> indexSelecteds = listaResposta.value
          .where((answer) => answer.indexArray == indexArray)
          .toList();
      if (indexSelecteds.isEmpty) return;
      currentClick.value.indexArrayTouch = indexArray;
      currentClick.notifyListeners();
    } catch (e) {}
  }

  Widget areaJogavel() {
    return Listener(
      onPointerUp: (event) => endClick(event),
      onPointerMove: (event) => updateClick(event),
      child: LayoutBuilder(
        builder: (context, constraints) {
          sizeBox = Size(constraints.maxWidth, constraints.maxWidth);
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: numBox,
              crossAxisSpacing: padding,
              mainAxisSpacing: padding,
            ),
            itemCount: numBox * numBox,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              String char =
                  listaPalavras.value.expand((e) => e).toList()[index];
              return Listener(
                onPointerDown: (event) => startClick(index),
                child: ValueListenableBuilder(
                  valueListenable: currentClick,
                  builder: (context, CurrentObj value, child) {
                    Color color = Colors.white;

                    if (value.currentLine.contains(index)) {
                      color = Colors.transparent;
                    } else if (palavrasFeitas.value.contains(index)) {
                      color = Colors.green.shade800;
                    }

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: color,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        char.toUpperCase(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void geradorRandomicoPalavras() {
    final List<String> wl = [
      'angico',
      'conservacao',
      'paineira',
      'area-verde',
      'bosque',
      'bako'
    ];

    final List<String> wl2 = [
      'floresta',
      'bacupari',
      'arvores',
      'biodiversidade',
      'bosque',
      'bako'
    ];

    final WSSettings ws = WSSettings(
      width: numBox,
      height: numBox,
      orientations: List.from([
        WSOrientation.horizontal,
        // WSOrientation.horizontalBack,
        WSOrientation.vertical,
        // WSOrientation.verticalUp,
        // WSOrientation.diagonal,
        // WSOrientation.diagonalUp,
      ]),
    );

    final WordSearchSafety wordSearch = WordSearchSafety();

    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    if (newPuzzle.errors!.isEmpty) {
      listaPalavras.value = newPuzzle.puzzle!;
      final WSSolved solved = wordSearch.solvePuzzle(newPuzzle.puzzle!, wl);

      listaResposta.value = solved.found!
          .map((solve) => RespostasCacaPalavra(solve, numPerRow: numBox))
          .toList();
    }
  }
}
