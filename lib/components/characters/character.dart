import 'package:flame/components.dart';
import 'package:rogue_adventure/assets/image/common_type.dart';
import 'package:rogue_adventure/assets/image/loader.dart';
import 'package:rogue_adventure/components/characters/enemy.dart';
import 'package:rogue_adventure/components/characters/npc.dart';
import 'package:rogue_adventure/components/characters/player.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';
import 'package:rogue_adventure/game/game.dart';

abstract class Character extends SpriteComponent
    with HasGameReference<MainGame> {
  late Vector2 coordinate;
  final dynamic gameParam;
  final String name;

  moveTo(KeyInputType direction);

  Character({
    required this.name,
    required super.sprite,
    required super.size,
    required super.key,
    required this.gameParam,
  });

  factory Character.initialize({required SpriteEntity entity}) {
    List<double> spriteSize = entity.assetParam['sprite_size'];
    Vector2 size = Vector2(spriteSize[0], spriteSize[1]);

    switch (entity.spriteSubCategory) {
      case SpriteSubCategoryType.playerCharacter:
        return Player(
            name: entity.name,
            sprite: entity.sprite,
            size: size,
            gameParam: entity.gameParam,
            key: ComponentKey.unique());
      case SpriteSubCategoryType.enemyCharacter:
        return Enemy(
            name: entity.name,
            sprite: entity.sprite,
            size: size,
            gameParam: entity.gameParam,
            key: ComponentKey.unique());
      case SpriteSubCategoryType.npcCharacter:
        return NPC(
            name: entity.name,
            sprite: entity.sprite,
            size: size,
            gameParam: entity.gameParam,
            key: ComponentKey.unique());
      default:
        throw Exception();
    }
  }
}
