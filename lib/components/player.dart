import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:rogue_adventure/components/key_direction.dart';
import 'package:rogue_adventure/components/sprite_direction.dart';
import 'package:rogue_adventure/systems/config.dart';

import '../game/game.dart';

class Player extends SpriteComponent with HasGameReference<MainGame> {
  KeyDirection currentPlayerDirection = KeyDirection.right;
  SpriteDirection currentSpriteDirection = SpriteDirection.right;

  var leftSide = KeyDirection.leftSide;
  var rightSide = KeyDirection.rightSide;
  var otherSide = KeyDirection.otherSide;

  void updatePlayerSprite(KeyDirection direction) {
    if (currentSpriteDirection == SpriteDirection.left &&
        rightSide.contains(direction)) {
      flipHorizontallyAroundCenter();
      currentSpriteDirection = SpriteDirection.right;
    } else if (currentSpriteDirection == SpriteDirection.right &&
        leftSide.contains(direction)) {
      flipHorizontallyAroundCenter();
      currentSpriteDirection = SpriteDirection.left;
    }
    currentPlayerDirection = direction;
  }

  moving() {
    switch (currentPlayerDirection.name) {
      case 'upLeft':
        game.camera.follow(this);
        add(MoveEffect.by(
          Vector2(-oneBlockSize, -oneBlockSize),
          EffectController(duration: 0.15),
        ));
      case 'up':
        game.camera.follow(this);
        add(MoveEffect.by(
          Vector2(0, -oneBlockSize),
          EffectController(duration: 0.15),
        ));
      case 'upRight':
        game.camera.follow(this);
        add(MoveEffect.by(
          Vector2(oneBlockSize, -oneBlockSize),
          EffectController(duration: 0.15),
        ));
      case 'left':
        game.camera.follow(this);
        add(MoveEffect.by(
          Vector2(-oneBlockSize, 0),
          EffectController(duration: 0.15),
        ));
      case 'center':
        game.camera.stop();
        add(SequenceEffect([
          MoveEffect.by(
            Vector2(0, -oneBlockSize / 2),
            EffectController(duration: 0.075),
          ),
          MoveEffect.by(
            Vector2(0, oneBlockSize / 2),
            EffectController(duration: 0.075),
          ),
        ]));
      case 'right':
        game.camera.follow(this);
        add(MoveEffect.by(
          Vector2(oneBlockSize, 0),
          EffectController(duration: 0.15),
        ));
      case 'downLeft':
        game.camera.follow(this);
        add(MoveEffect.by(
          Vector2(-oneBlockSize, oneBlockSize),
          EffectController(duration: 0.15),
        ));
      case 'down':
        game.camera.follow(this);
        add(MoveEffect.by(
          Vector2(0, oneBlockSize),
          EffectController(duration: 0.15),
        ));
      case 'downRight':
        game.camera.follow(this);
        add(MoveEffect.by(
          Vector2(oneBlockSize, oneBlockSize),
          EffectController(duration: 0.15),
        ));
    }
  }

  void moveTo(KeyDirection direction) {
    print(direction.name);
    updatePlayerSprite(direction);
    moving();
  }

  Player({
    required Vector2 size,
    required Sprite? sprite,
    required Vector2 position,
    required Anchor anchor,

  }) : super(size: size, sprite: sprite, position: position, anchor: anchor);
}
