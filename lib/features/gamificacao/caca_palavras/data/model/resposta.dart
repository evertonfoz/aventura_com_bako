import 'package:word_search_safety/word_search_safety.dart';

class RespostasCacaPalavra {
  bool done = false;
  int? indexArray;
  WSLocation wsLocation;
  List<int>? answerLines;

  RespostasCacaPalavra(this.wsLocation, {required int numPerRow}) {
    indexArray = wsLocation.y * numPerRow + wsLocation.x;
    generateAnswerLine(numPerRow);
  }

  void generateAnswerLine(int numPerRow) {
    answerLines = [];
    answerLines!.addAll(List<int>.generate(wsLocation.overlap,
        (index) => generateIndexBaseOnAxis(wsLocation, index, numPerRow)));
  }

  generateIndexBaseOnAxis(WSLocation wsLocation, int i, int numPerRow) {
    int x = wsLocation.x, y = wsLocation.y;

    if (wsLocation.orientation == WSOrientation.horizontal ||
        wsLocation.orientation == WSOrientation.horizontalBack) {
      x = (wsLocation.orientation == WSOrientation.horizontal) ? x + i : x - i;
    } else {
      y = (wsLocation.orientation == WSOrientation.vertical) ? y + i : y - i;
    }

    return x + y * numPerRow;
  }
}
