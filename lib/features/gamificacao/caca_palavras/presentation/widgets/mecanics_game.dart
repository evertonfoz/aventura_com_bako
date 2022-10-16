import 'package:aventura_com_bako/features/gamificacao/caca_palavras/data/model/current_obj.dart';
import 'package:aventura_com_bako/features/gamificacao/caca_palavras/data/model/resposta.dart';
import 'package:flutter/cupertino.dart';
import 'package:word_search_safety/word_search_safety.dart';

class MecanicsGame {
  // PointerUpEvent? eventUp;
  // PointerMoveEvent? eventMove;
  // PointerMoveEvent? eventLine;
  // Offset? localPosition;
  // int? indexArray;
  ValueNotifier<List<List<String>>>? listChars;
  ValueNotifier<List<RespostasCacaPalavra>>? answerList;
  ValueNotifier<CurrentObj>? currentDragObj;
  ValueNotifier<List<int>>? charsDone;
  int? numBox;

  double padding = 5;
  Size sizeBox = Size.zero;

  MecanicsGame(
    // this.eventUp,
    // this.eventMove,
    // this.eventLine,
    // this.localPosition,
    // this.indexArray,

    this.numBox,
    this.listChars,
    this.answerList,
    this.currentDragObj,
    this.charsDone,
  );

  void onDragEnd(PointerUpEvent? event) {
    print("PointerUpEvent");
    // check if drag line object got value or not.. if no no need to clear
    if (currentDragObj!.value.currentLine == null) return;

    currentDragObj!.value.currentLine.clear();
    currentDragObj!.notifyListeners();
  }

  void onDragUpdate(PointerMoveEvent event) {
    // generate ondragLine so we know to highlight path later & clear if condition dont meet .. :D
    generateLineOnDrag(event);

    // get index on drag

    int indexFound = answerList!.value.indexWhere((answer) {
      return answer.answerLines!.join("-") ==
          currentDragObj!.value.currentLine.join("-");
    });

    print(currentDragObj!.value.currentLine.join("-"));
    if (indexFound >= 0) {
      answerList!.value[indexFound].done = true;
      // save answerList which complete
      charsDone!.value.addAll(answerList!.value[indexFound].answerLines!);
      charsDone!.notifyListeners();
      answerList!.notifyListeners();
      onDragEnd(null);
    }
  }

  int calculateIndexBasePosLocal(Offset localPosition) {
    // get size max per box
    double maxSizeBox = ((sizeBox.width - (numBox! - 1) * padding) / numBox!);

    if (localPosition.dy > sizeBox.width || localPosition.dx > sizeBox.width)
      return -1;

    int x = 0, y = 0;
    double yAxis = 0, xAxis = 0;
    double yAxisStart = 0, xAxisStart = 0;

    for (var i = 0; i < numBox!; i++) {
      xAxisStart = xAxis;
      xAxis +=
          maxSizeBox + (i == 0 || i == (numBox! - 1) ? padding / 2 : padding);

      if (xAxisStart < localPosition.dx && xAxis > localPosition.dx) {
        x = i;
        break;
      }
    }

    for (var i = 0; i < numBox!; i++) {
      yAxisStart = yAxis;
      yAxis +=
          maxSizeBox + (i == 0 || i == (numBox! - 1) ? padding / 2 : padding);

      if (yAxisStart < localPosition.dy && yAxis > localPosition.dy) {
        y = i;
        break;
      }
    }

    return y * numBox! + x;
  }

  void generateLineOnDrag(PointerMoveEvent event) {
    // if current drag line is null, dlcare new list for we can save value
    // ignore: prefer_conditional_assignment
    if (currentDragObj!.value.currentLine == null) {
      currentDragObj!.value.currentLine = <int>[];
    }

    // we need calculate index array base local position on drag
    int indexBase = calculateIndexBasePosLocal(event.localPosition);

    if (indexBase >= 0) {
      // check drag line already pass 2 box
      if (currentDragObj!.value.currentLine.length >= 2) {
        // check drag line is straight line
        late WSOrientation wsOrientation;

        if (currentDragObj!.value.currentLine[0] % numBox! ==
            currentDragObj!.value.currentLine[1] % numBox!) {
          wsOrientation = WSOrientation.vertical;
        } // this should vertical.. my mistake.. :)
        else if (currentDragObj!.value.currentLine[0] ~/ numBox! ==
            currentDragObj!.value.currentLine[1] ~/ numBox!) {
          wsOrientation = WSOrientation.horizontal;
        }

        if (wsOrientation == WSOrientation.horizontal) {
          if (indexBase ~/ numBox! !=
              currentDragObj!.value.currentLine[1] ~/ numBox!) {
            onDragEnd(null);
          }
        } else if (wsOrientation == WSOrientation.vertical) {
          if (indexBase % numBox! !=
              currentDragObj!.value.currentLine[1] % numBox!) {
            onDragEnd(null);
          }
        } else {
          onDragEnd(null);
        }
      }

      if (!currentDragObj!.value.currentLine.contains(indexBase)) {
        currentDragObj!.value.currentLine.add(indexBase);
      } else if (currentDragObj!.value.currentLine.length >= 2) {
        if (currentDragObj!.value
                .currentLine[currentDragObj!.value.currentLine.length - 2] ==
            indexBase) onDragEnd(null);
      }
    }
    // before mistake , should in here
    currentDragObj!.notifyListeners();
  }

  void onDragStart(int indexArray) {
    try {
      List<RespostasCacaPalavra> indexSelecteds = answerList!.value
          .where((answer) => answer.indexArray == indexArray)
          .toList();

      // check indexSelecteds got any match , if 0 no proceed!
      if (indexSelecteds.isEmpty) return;
      // nice triggered
      currentDragObj!.value.indexArrayTouch = indexArray;
      currentDragObj!.notifyListeners();
    } catch (e) {}
  }

  void generateRandomWord() {
    final List<String> wl = [
      'hello',
      'world',
      'foo',
      'bar',
      'baz',
      'dart',
      'teste',
      'lenda'
    ];

    final WSSettings ws = WSSettings(
      width: numBox!,
      height: numBox!,
      orientations: List.from([
        WSOrientation.horizontal,
        WSOrientation.vertical,
        WSOrientation.diagonal,
      ]),
    );

    final WordSearchSafety wordSearch = WordSearchSafety();
    final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);

    if (newPuzzle.errors!.isEmpty) {
      listChars!.value = newPuzzle.puzzle!;
      final WSSolved solved = wordSearch.solvePuzzle(newPuzzle.puzzle!, wl);

      answerList!.value = solved.found!
          .map((solve) => RespostasCacaPalavra(solve, numPerRow: numBox!))
          .toList();
    }
  }
}
