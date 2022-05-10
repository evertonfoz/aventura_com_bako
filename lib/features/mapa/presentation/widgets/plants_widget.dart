import 'package:aventura_com_bako/features/mapa/presentation/page/mapa_screen.dart';
import 'package:aventura_com_bako/features/mapa/presentation/widgets/bako_widget.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Plants extends PositionComponent
    with GestureHitboxes, CollisionCallbacks {
  Plants({
    required this.mapa,
    required Vector2? position,
    required Vector2? size,
    Vector2? scale,
    double? angle,
    Anchor? anchor,
    int? priority,
  }) : super(
          position: position,
          size: size,
          scale: scale,
          angle: angle,
          anchor: anchor,
        ) {
    debugMode = true;
  }

  late ShapeHitbox hitbox;
  final MapScreen mapa;

  @override
  Future<void> onLoad() async {
    hitbox = RectangleHitbox()..renderShape = true;
    add(hitbox);

    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Bako) {
      mapa.overlays.add('QrCodePage');
      if (mapa.placar == 21) {
        mapa.fullScore = true;
      } else {
        mapa.placar++;
      }
      mapa.overlays.notifyListeners();
    }
  }
}
