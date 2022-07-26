import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class CollisionPoints extends PositionComponent
    with GestureHitboxes, CollisionCallbacks {
  CollisionPoints({
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

  @override
  Future<void> onLoad() async {
    hitbox = RectangleHitbox();
    //..renderShape = true;
    add(hitbox);

    return super.onLoad();
  }
}
