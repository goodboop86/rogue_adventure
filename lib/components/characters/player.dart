import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';
import 'package:rogue_adventure/components/characters/character.dart';
import 'package:rogue_adventure/components/floor_component.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';
import 'package:rogue_adventure/enums/component/sprite_direction.dart';
import 'package:rogue_adventure/systems/config.dart';

import '../../game/game.dart';

class Player extends Character {
  late TextComponent text;
  KeyInputType currentPlayerDirection = KeyInputType.right;
  SpriteDirection currentSpriteDirection = SpriteDirection.right;

  var leftSide = KeyInputType.leftDirectionKeys;
  var rightSide = KeyInputType.rightDirectionKeys;
  var otherSide = KeyInputType.otherDirectionKeys;

  void updatePlayerFacing(KeyInputType direction) {
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

  @override
  void onLoad() async {
    text = TextComponent(
      anchor: Anchor.bottomLeft,
      text: '$coordinate',
      textRenderer: TextPaint(
        style: TextStyle(
          fontSize: 12.0,
          color: BasicPalette.white.color,
        ),
      ),
      position: Vector2.all(0.0),
    );
    add(text);
  }

  @override
  moveTo(KeyInputType direction) {
    print(direction.name);
    updatePlayerFacing(direction);

    Vector2 distance;
    switch (currentPlayerDirection.name) {
      case 'upLeft':
        game.camera.follow(this);
        distance = Vector2(-oneBlockSize, -oneBlockSize);
        add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case 'up':
        game.camera.follow(this);
        distance = Vector2(0, -oneBlockSize);
        add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case 'upRight':
        game.camera.follow(this);
        distance = Vector2(oneBlockSize, -oneBlockSize);
        add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case 'left':
        game.camera.follow(this);
        distance = Vector2(-oneBlockSize, 0);
        add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case 'center':
        game.camera.stop();
        Vector2 distanceFrom = Vector2(0, -oneBlockSize / 2);
        Vector2 distanceTo = Vector2(0, oneBlockSize / 2);
        distance = Vector2(0, 0);
        add(SequenceEffect([
          MoveEffect.by(
            distanceFrom,
            EffectController(duration: 0.075),
          ),
          MoveEffect.by(
            distanceTo,
            EffectController(duration: 0.075),
          ),
        ]));
      case 'right':
        game.camera.follow(this);
        distance = Vector2(oneBlockSize, 0);
        add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case 'downLeft':
        game.camera.follow(this);
        distance = Vector2(-oneBlockSize, oneBlockSize);
        add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case 'down':
        game.camera.follow(this);
        distance = Vector2(0, oneBlockSize);
        add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case 'downRight':
        game.camera.follow(this);
        distance = Vector2(oneBlockSize, oneBlockSize);
        add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      default:
        throw Exception();
    }
    coordinate += distance/oneBlockSize;
    text.text ='$coordinate';
    var floorComponent = game.findByKeyName('floorComponent') as FloorComponent;
    floorComponent.glowAroundComponentFromCoordinate(coordinate);
  }


  Player({
    required super.name,
    required super.sprite,
    required super.size,
    required super.key,
    required super.gameParam,
  });
}
