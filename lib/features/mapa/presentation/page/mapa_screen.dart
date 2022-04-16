import 'dart:ui';

import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:aventura_com_bako/features/mapa/widgets/bako_widget.dart';
import 'package:aventura_com_bako/features/mapa/widgets/mapa_widget.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';

class MapScreen extends FlameGame {
  final Bako _bako = Bako();
  final Mapa _mapa = Mapa();

  @override
  Future<void> onLoad() async {
    add(_mapa);
    add(_bako);

    _bako.position = _mapa.size / 8;
    camera.followComponent(_bako,
        worldBounds: Rect.fromLTRB(0, 0, _mapa.size.x, _mapa.size.y));
  }

  void onJoystickDirectionChanged(Direction direction) {
    _bako.direction = direction;
  }
}
