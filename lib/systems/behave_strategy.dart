import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:logging/logging.dart';
import 'package:rogue_adventure/components/characters/character.dart';
import 'package:rogue_adventure/components/floor_component.dart';
import 'package:rogue_adventure/enums/component/sprite_direction.dart';
import 'package:rogue_adventure/systems/config.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';

abstract class CharacterOperationStrategy {
  final Logger _log = Logger('CharacterOperationStrategy');
  late Character character;
  late KeyInputType input;

  void execute() {}
  CharacterOperationStrategy({required this.character, required this.input});
}

class CharacterMoveOperationStrategy extends CharacterOperationStrategy {
  CharacterMoveOperationStrategy({required super.character, required super.input});

  @override
  void execute() {
    _log.info("executing move operation strategy");
    character.currentCharacterDirection = input;
    updateFacing();
    moveTo();
  }

  void updateFacing() {

    if (character.currentSpriteFacing == SpriteFacing.left &&
        KeyInputType.rightDirectionKeys.contains(character.currentSpriteFacing)) {
      character.flipHorizontallyAroundCenter();
      character.currentSpriteFacing = SpriteFacing.right;
    } else if (character.currentSpriteFacing == SpriteFacing.right &&
        KeyInputType.leftDirectionKeys.contains(character.currentSpriteFacing)) {
      character.flipHorizontallyAroundCenter();
      character.currentSpriteFacing = SpriteFacing.left;
    }
  }

  moveTo() {
    _log.info("moving to ${character.currentCharacterDirection}");

    Vector2 distance;
    switch (character.currentCharacterDirection) {
      case KeyInputType.upLeft:
        character.game.camera.follow(character);
        distance = Vector2(-oneBlockSize, -oneBlockSize);
        character.add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case KeyInputType.up:
        character.game.camera.follow(character);
        distance = Vector2(0, -oneBlockSize);
        character.add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case KeyInputType.upRight:
        character.game.camera.follow(character);
        distance = Vector2(oneBlockSize, -oneBlockSize);
        character.add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case KeyInputType.left:
        character.game.camera.follow(character);
        distance = Vector2(-oneBlockSize, 0);
        character.add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case KeyInputType.center:
        character.game.camera.stop();
        Vector2 distanceFrom = Vector2(0, -oneBlockSize / 2);
        Vector2 distanceTo = Vector2(0, oneBlockSize / 2);
        distance = Vector2(0, 0);
        character.add(SequenceEffect([
          MoveEffect.by(
            distanceFrom,
            EffectController(duration: 0.075),
          ),
          MoveEffect.by(
            distanceTo,
            EffectController(duration: 0.075),
          ),
        ]));
      case KeyInputType.right:
        character.game.camera.follow(character);
        distance = Vector2(oneBlockSize, 0);
        character.add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case KeyInputType.downLeft:
        character.game.camera.follow(character);
        distance = Vector2(-oneBlockSize, oneBlockSize);
        character.add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case KeyInputType.down:
        character.game.camera.follow(character);
        distance = Vector2(0, oneBlockSize);
        character.add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      case KeyInputType.downRight:
        character.game.camera.follow(character);
        distance = Vector2(oneBlockSize, oneBlockSize);
        character.add(MoveEffect.by(
          distance,
          EffectController(duration: 0.15),
        ));
      default:
        throw Exception();
    }
    character.coordinate += distance/oneBlockSize;
    character.text.text ='${character.coordinate}';
    var floorComponent = character.game.findByKeyName('floorComponent') as FloorComponent;
    floorComponent.glowAroundComponentFromCoordinate(character.coordinate);
  }
}