import 'package:flame/components.dart';

class Mapa extends SpriteComponent with HasGameRef {
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('test_background.png');
    size = sprite!.originalSize;
    return super.onLoad();
  }
}
