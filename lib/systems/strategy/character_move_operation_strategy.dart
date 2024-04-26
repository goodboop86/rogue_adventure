import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:rogue_adventure/components/blocks/blocks.dart';
import 'package:rogue_adventure/components/blocks/floor.dart';
import 'package:rogue_adventure/components/blocks/wall.dart';
import 'package:rogue_adventure/components/characters/character.dart';
import 'package:rogue_adventure/components/characters/enemy.dart';
import 'package:rogue_adventure/components/characters/npc.dart';
import 'package:rogue_adventure/components/floor_component.dart';
import 'package:rogue_adventure/systems/config.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';
import 'package:rogue_adventure/systems/strategy/charactor_operation_strategy.dart';

class CharacterMoveOperationStrategy extends CharacterOperationStrategy {
  CharacterMoveOperationStrategy(
      {required super.character, required super.input});

  @override
  void execute() {
    logging.info("executing move operation strategy");
    character.currentCharacterDirection = input;
    updateFacing();
    if (isMovable()) {
      moveTo();
    }
  }


  bool isMovable() {
    logging.info("checking if movable");

    bool isMovable = true;
    Vector2 point = (character.coordinate + getMovingVector() / oneBlockSize);
    logging.info("point: ${point.x / oneBlockSize}, ${point.y / oneBlockSize}");
    //List<FloorComponent> floors = character.game.world.children.query<FloorComponent>();
    FloorComponent floor = character.game.findByKey(ComponentKey.named('floorComponent')) as FloorComponent;
    floor.children.query<Wall>().forEach((wall) {
      if (wall.coordinate == point) {
        isMovable = false;
      }
    });
    List<Enemy> enemies = character.game.world.children.query<Enemy>();
    for (var enemy in enemies) {
      if (enemy.coordinate == point) {
        isMovable = false;
      }
    }

    List<NPC> npcs = character.game.world.children.query<NPC>();
    for (var npc in npcs) {
      if (npc.coordinate == point) {
        isMovable = false;
      }
    }

    return isMovable;
  }

  void updateFacing() {
    logging.info("updating facing");
    logging.info("current facing: ${character.currentSpriteFacing}");
    logging.info("input: $input");

    if (shouldFlipToRight()) {
      character.flipHorizontallyAroundCenter();
      character.currentSpriteFacing = SpriteFacing.right;
    } else if (shouldFlipToLeft()) {
      character.flipHorizontallyAroundCenter();
      character.currentSpriteFacing = SpriteFacing.left;
    }
  }

  bool characterIsFacingLeft() {
    return character.currentSpriteFacing == SpriteFacing.left;
  }

  bool characterIsFacingRight() {
    return character.currentSpriteFacing == SpriteFacing.right;
  }

  bool shouldFlipToRight() {
    return characterIsFacingLeft() && KeyInputType.isRight(input);
  }

  bool shouldFlipToLeft() {
    return characterIsFacingRight() && KeyInputType.isLeft(input);
  }

  moveTo() {
    logging.info("moving to ${character.currentCharacterDirection}");

    Vector2 distance = getMovingVector();
    if (character.currentCharacterDirection == KeyInputType.center) {
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
    } else {
      character.game.camera.follow(character);
      character.add(MoveEffect.by(
        distance,
        EffectController(duration: 0.15),
      ));
    }
    character.coordinate += distance / oneBlockSize;
    character.text.text = '${character.coordinate}';
    var floorComponent =
        character.game.findByKeyName('floorComponent') as FloorComponent;
    floorComponent.glowAroundComponentFromCoordinate(character.coordinate);
  }

  Vector2 getMovingVector() {
    switch (character.currentCharacterDirection) {
      case KeyInputType.upLeft:
        return Vector2(-oneBlockSize, -oneBlockSize);
      case KeyInputType.up:
        return Vector2(0, -oneBlockSize);
      case KeyInputType.upRight:
        return Vector2(oneBlockSize, -oneBlockSize);
      case KeyInputType.left:
        return Vector2(-oneBlockSize, 0);
      case KeyInputType.center:
        return Vector2(0, 0);
      case KeyInputType.right:
        return Vector2(oneBlockSize, 0);
      case KeyInputType.downLeft:
        return Vector2(-oneBlockSize, oneBlockSize);
      case KeyInputType.down:
        return Vector2(0, oneBlockSize);
      case KeyInputType.downRight:
        return Vector2(oneBlockSize, oneBlockSize);
      default:
        throw Exception();
    }
  }
}
