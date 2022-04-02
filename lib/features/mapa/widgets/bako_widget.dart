import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:flame/components.dart';

class Bako extends SpriteComponent with HasGameRef {
  Bako()
      : super(
          size: Vector2.all(50.0),
        );

  Direction direction = Direction.none;
  final double _bakoSpeed = 300.0;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('test_player.png');
    position = gameRef.size / 2;
  }

  @override
  void update(double delta) {
    super.update(delta);
    moveBako(delta);
  }

  void moveBako(double delta) {
    switch (direction) {
      case Direction.up:
        moveUp(delta);
        break;
      case Direction.down:
        moveDown(delta);
        break;
      case Direction.left:
        moveLeft(delta);
        break;
      case Direction.right:
        moveRight(delta);
        break;
      case Direction.none:
        break;
    }
  }

  void moveDown(double delta) {
    position.add(Vector2(0, delta * _bakoSpeed));
  }

  void moveUp(double delta) {
    position.add(Vector2(0, delta * -_bakoSpeed));
  }

  void moveLeft(double delta) {
    position.add(Vector2(delta * -_bakoSpeed, 0));
  }

  void moveRight(double delta) {
    position.add(Vector2(delta * _bakoSpeed, 0));
  }
}
