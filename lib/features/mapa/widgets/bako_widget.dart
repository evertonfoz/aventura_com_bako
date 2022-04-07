import 'package:aventura_com_bako/features/mapa/helpers/enums/direction_enum.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

class Bako extends FlameGame {
  Direction direction = Direction.none;
  final double _bakoSpeed = 300.0;
  final double _animationSpeed = 0.15;
  late final SpriteAnimation _runDownAnimation;
  late final SpriteAnimation _runLeftAnimation;
  late final SpriteAnimation _runUpAnimation;
  late final SpriteAnimation _runRightAnimation;
  late final SpriteAnimation _standingAnimation;
  late SpriteAnimationComponent baku;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // sprite = await gameRef.loadSprite('test_player.png');
    // position = gameRef.size / 2;
    _loadAnimations().then((_) => {baku.animation = _standingAnimation});
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await images.load('test_player_spritesheet.png'),
      srcSize: Vector2(29.0, 32.0),
    );

    //frente - primeira linha do spritesheet
    _runDownAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 4);

    //esquerda - segunda linha do spritesheet
    _runLeftAnimation =
        spriteSheet.createAnimation(row: 1, stepTime: _animationSpeed, to: 4);

    //costas - terceira linha do spritesheet
    _runUpAnimation =
        spriteSheet.createAnimation(row: 2, stepTime: _animationSpeed, to: 4);

    //direita - ultima linha do spritesheet
    _runRightAnimation =
        spriteSheet.createAnimation(row: 3, stepTime: _animationSpeed, to: 4);

    _standingAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: _animationSpeed, to: 1);

    baku = SpriteAnimationComponent()
      ..animation = _standingAnimation
      ..position = Vector2(100, 200)
      ..size = Vector2.all(50);

    add(baku);
  }

  @override
  void update(double delta) {
    super.update(delta);
    moveBako(delta);
  }

  void moveBako(double delta) {
    switch (direction) {
      case Direction.up:
        baku.animation = _runUpAnimation;
        moveUp(delta);
        break;
      case Direction.down:
        baku.animation = _runDownAnimation;
        moveDown(delta);
        break;
      case Direction.left:
        baku.animation = _runLeftAnimation;
        moveLeft(delta);
        break;
      case Direction.right:
        baku.animation = _runRightAnimation;
        moveRight(delta);
        break;
      case Direction.none:
        baku.animation = _standingAnimation;
        break;
    }
  }

  void moveDown(double delta) {
    baku.position.add(Vector2(0, delta * _bakoSpeed));
  }

  void moveUp(double delta) {
    baku.position.add(Vector2(0, delta * -_bakoSpeed));
  }

  void moveLeft(double delta) {
    baku.position.add(Vector2(delta * -_bakoSpeed, 0));
  }

  void moveRight(double delta) {
    baku.position.add(Vector2(delta * _bakoSpeed, 0));
  }
}
