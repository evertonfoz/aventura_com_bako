import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:aventura_com_bako/features/mapa/presentation/widgets/bako_widget.dart';
import 'package:aventura_com_bako/features/mapa/presentation/widgets/collisionPoints_widget.dart';
import 'package:aventura_com_bako/features/mapa/presentation/widgets/plants_widget.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/widgets.dart';

class MapScreen extends FlameGame with HasCollisionDetection {
  late double mapWidth;
  late double mapHeight;
  late Bako bako;
  int placar = 0;

  @override
  Future<void> onLoad() async {
    final _mapa = await TiledComponent.load('mapa-v4.tmx', Vector2.all(16));
    mapWidth = _mapa.tileMap.map.width * 16.0;
    mapHeight = _mapa.tileMap.map.height * 16.0;
    add(_mapa);

    overlays.add('BotoesPage');
    addActors(_mapa.tileMap);

    camera.followComponent(bako,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));

    return super.onLoad();
  }

  void addActors(RenderableTiledMap tileMap) {
    //pontos de colisão
    late final collisionPointsLayer =
        tileMap.getObjectGroupFromLayer('CollisionPoints');

    for (final collisionPointsObject in collisionPointsLayer.objects) {
      final collisionPoints = CollisionPoints(
        position: Vector2(collisionPointsObject.x, collisionPointsObject.y),
        size: Vector2(
          collisionPointsObject.width,
          collisionPointsObject.height,
        ),
      );
      add(collisionPoints);
    }

    //plantas
    late final plantsLayer = tileMap.getObjectGroupFromLayer('Plants');

    for (final plantsObject in plantsLayer.objects) {
      final plants = Plants(
        mapa: this,
        position: Vector2(plantsObject.x, plantsObject.y),
        size: Vector2(
          plantsObject.width,
          plantsObject.height,
        ),
      );
      add(plants);
    }

    // bako (player)
    late final spawnPointsLayer =
        tileMap.getObjectGroupFromLayer('SpawnPoints');

    for (final spawnPoint in spawnPointsLayer.objects) {
      switch (spawnPoint.type) {
        case 'Player':
          bako = Bako(Vector2(spawnPoint.x, spawnPoint.y));
          add(bako);
          break;
        default:
      }
    }
  }

  void onJoystickDirectionChanged(Direction direction) {
    bako.direction = direction;
  }
}
