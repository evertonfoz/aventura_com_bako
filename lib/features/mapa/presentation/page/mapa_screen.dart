import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:aventura_com_bako/features/mapa/widgets/bako_widget.dart';
import 'package:flame/game.dart';

class MapScreen extends FlameGame {
  final Bako _bako = Bako();

  @override
  Future<void> onLoad() async {
    add(_bako);
  }

  void onJoystickDirectionChanged(Direction direction) {
    _bako.direction = direction;
  }
}
