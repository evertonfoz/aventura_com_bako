import 'package:mobx/mobx.dart';

part 'quebra_cabeca_mobx.g.dart';

class QuebraCabecaMobx = _QuebraCabecaMobx with _$QuebraCabecaMobx;

abstract class _QuebraCabecaMobx with Store {
  @observable
  int _movesCount = 0;

  int get movesCount => _movesCount;
  set newMovesCount(int newMovesCount) => _movesCount = newMovesCount;

  @observable
  int _index = 0;

  int get index => _index;
  set newIndex(int newIndex) => _index = newIndex;

}
