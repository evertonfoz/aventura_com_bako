import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Bako extends SpriteAnimationComponent with HasGameRef {
  Direction direction = Direction.none;
  final double _bakoSpeed = 300.0;
  final double _animationSpeed = 0.15;
  late final SpriteAnimation _runDownAnimation;
  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;
  late SpriteAnimationComponent bako;

  Bako()
      : super(
          size: Vector2.all(50.0),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _loadAnimations().then((_) => {animation = _standingAnimation});
  }

  @override
  void update(double delta) {
    super.update(delta);
    moveBako(delta);
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('test_player_spritesheet.png'),
      srcSize: Vector2(29.0, 32.0),
    );

    _runDownAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 4);

    _runLeftAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 4);

    _runUpAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: _animationSpeed, to: 4);

    _runRightAnimation =
        spriteSheet.createAnimation(row: 3, stepTime: _animationSpeed, to: 4);

    _standingAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 1);

    bako = SpriteAnimationComponent()
      ..animation = _standingAnimation
      ..position = Vector2(1000, 1000)
      ..size = Vector2.all(100);

    add(bako);
  }

  void moveBako(double delta) {
    switch (direction) {
      case Direction.up:
        animation = _runUpAnimation;
        moveUp(delta);

        break;
      case Direction.down:
        animation = _runDownAnimation;
        moveDown(delta);

        break;
      case Direction.left:
        animation = _runLeftAnimation;
        moveLeft(delta);

        break;
      case Direction.right:
        animation = _runRightAnimation;
        moveRight(delta);
        break;
      case Direction.none:
        animation = _standingAnimation;
        break;
    }
  }

  void moveUp(double delta) {
    position.add(Vector2(0, delta * -_bakoSpeed));
  }

  void moveDown(double delta) {
    position.add(Vector2(0, delta * _bakoSpeed));
  }

  void moveLeft(double delta) {
    position.add(Vector2(delta * -_bakoSpeed, 0));
  }

  void moveRight(double delta) {
    position.add(Vector2(delta * _bakoSpeed, 0));
  }
}
