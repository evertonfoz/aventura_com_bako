import 'package:aventura_com_bako/features/informacoes_especies/data/model/informacoes_model.dart';
import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:aventura_com_bako/features/mapa/presentation/widgets/bako_widget.dart';
import 'package:aventura_com_bako/features/mapa/presentation/widgets/collisionPoints_widget.dart';
import 'package:aventura_com_bako/features/mapa/presentation/widgets/plants_widget.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/widgets.dart';
import 'package:tiled/tiled.dart';

import '../../../informacoes_especies/helpers/enums/informacoes_especies_enum.dart';

class MapScreen extends FlameGame with HasCollisionDetection {
  late double mapWidth;
  late double mapHeight;
  late Bako bako;
  int placar = 0;
  late bool fullScore = false;
  late bool mostrarQrCodePage = true;
  InformacoesEspeciesEnum? pontoCapturado;

  @override
  Future<void> onLoad() async {
    final mapa = await TiledComponent.load('mapa-v6.tmx', Vector2.all(16));
    mapWidth = mapa.tileMap.map.width * 16.0;
    mapHeight = mapa.tileMap.map.height * 16.0;
    add(mapa);

    overlays.add('BotoesPage');
    overlays.add('JoyStick');

    addActors(mapa.tileMap);

    camera.followComponent(bako,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));

    return super.onLoad();
  }

  void addActors(RenderableTiledMap tileMap) {
    //pontos de colisão
    late final collisionPointsLayer =
        tileMap.getLayer<ObjectGroup>('CollisionPoints');

    for (final collisionPointsObject in collisionPointsLayer!.objects) {
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
    late final plantsLayer = tileMap.getLayer<ObjectGroup>('Plants');

    for (final plantsObject in plantsLayer!.objects) {
      final plants = Plants(
        mapa: this,
        position: Vector2(plantsObject.x, plantsObject.y),
        informacoesEspeciesEnum:
            InformacoesEspeciesEnum.values.asNameMap()[plantsObject.name],
        size: Vector2(
          plantsObject.width,
          plantsObject.height,
        ),
      );
      add(plants);
    }

    // bako (player)
    late final spawnPointsLayer = tileMap.getLayer<ObjectGroup>('SpawnPoints');

    for (final spawnPoint in spawnPointsLayer!.objects) {
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
