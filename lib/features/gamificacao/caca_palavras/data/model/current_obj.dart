import 'package:flutter/animation.dart';

class CurrentObj {
  Offset currentPos;
  Offset? currentToque;
  int? indexArrayTouch;
  List<int> currentLine = <int>[];

  CurrentObj(this.currentPos, this.currentLine,
      {required this.indexArrayTouch, required this.currentToque});
}
