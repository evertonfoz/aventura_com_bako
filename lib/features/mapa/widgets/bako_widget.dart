import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:aventura_com_bako/features/mapa/widgets/collisionPoints_widget.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Bako extends SpriteAnimationComponent
    with HasGameRef, CollisionCallbacks {
  Direction direction = Direction.none;
  late double mapWidth = 0;
  late double mapHeight = 0;
  final double _bakoSpeed = 100.0;
  final double _animationSpeed = 0.15;
  late final SpriteAnimation _runDownAnimation;
  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;
  late SpriteAnimationComponent bako;

  Bako(Vector2? position) : super(size: Vector2.all(20.0), position: position);

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
      ..position = position
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

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is CollisionPoints) {
      if (intersectionPoints.length == 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = absoluteCenter - mid;
        final separationDistance = (size.x / 2) - collisionNormal.length;
        collisionNormal.normalize();

        position += collisionNormal.scaled(separationDistance);
      }

      super.onCollisionStart(intersectionPoints, other);
    }
  }
}
