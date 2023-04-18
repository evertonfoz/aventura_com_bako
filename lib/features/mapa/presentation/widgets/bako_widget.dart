import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:aventura_com_bako/features/mapa/presentation/controller/bako_controller.dart';
import 'package:aventura_com_bako/features/mapa/presentation/widgets/collisionPoints_widget.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:get/get.dart';

class Bako extends SpriteAnimationComponent
    with HasGameRef, GestureHitboxes, CollisionCallbacks {
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
  late ShapeHitbox hitbox;
  Direction _collisionDirection = Direction.none;
  bool _hasCollided = false;
  BakoController controller = Get.put(BakoController());

  Bako(Vector2? position)
      : super(
          size: Vector2.all(60.0),
          position: position,
          anchor: Anchor.center,
        ) {
    debugMode = false;
  }

  @override
  Future<void> onLoad() async {
    _loadAnimations().then((_) => {animation = _standingAnimation});
    hitbox = CircleHitbox()..renderShape = false;
    add(hitbox);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    moveBako(dt);
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('BakoCiclo_1024.png'),
      srcSize: Vector2(256, 256),
    );

    _runDownAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 4);

    _runLeftAnimation =
        spriteSheet.createAnimation(row: 3, stepTime: _animationSpeed, to: 4);

    _runUpAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 4);

    _runRightAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: _animationSpeed, to: 4);

    _standingAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 1);

    bako = SpriteAnimationComponent()
      ..animation = _standingAnimation
      ..position = position
      ..size = Vector2.all(60);

    add(bako);
  }

  void moveBako(double delta) {
    switch (direction) {
      case Direction.up:
        if (canPlayerMoveUp()) {
          animation = _runUpAnimation;
          moveUp(delta);
        }
        break;
      case Direction.down:
        if (canPlayerMoveDown()) {
          animation = _runDownAnimation;
          moveDown(delta);
        }
        break;
      case Direction.left:
        if (canPlayerMoveLeft()) {
          animation = _runLeftAnimation;
          moveLeft(delta);
        }
        break;
      case Direction.right:
        if (canPlayerMoveRight()) {
          animation = _runRightAnimation;
          moveRight(delta);
        }
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

  bool canPlayerMoveUp() {
    if (_hasCollided && _collisionDirection == Direction.up) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveDown() {
    if (_hasCollided && _collisionDirection == Direction.down) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveLeft() {
    if (_hasCollided && _collisionDirection == Direction.left) {
      return false;
    }
    return true;
  }

  bool canPlayerMoveRight() {
    if (_hasCollided && _collisionDirection == Direction.right) {
      return false;
    }
    return true;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is CollisionPoints) {
      if (!_hasCollided) {
        _hasCollided = true;
        _collisionDirection = direction;
      }
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    if (other is CollisionPoints) {
      _hasCollided = false;
    }
  }
}
