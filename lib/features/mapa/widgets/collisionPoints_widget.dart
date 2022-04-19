import 'package:flame/components.dart';

class CollisionPoints extends PositionComponent {
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
}
