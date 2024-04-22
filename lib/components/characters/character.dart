import 'package:flame/components.dart';
import 'package:rogue_adventure/assets/image/common_type.dart';
import 'package:rogue_adventure/assets/image/loader.dart';
import 'package:rogue_adventure/components/characters/enemy.dart';
import 'package:rogue_adventure/components/characters/npc.dart';
import 'package:rogue_adventure/components/characters/player.dart';
import 'package:rogue_adventure/enums/component/sprite_direction.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';
import 'package:rogue_adventure/game/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';

abstract class Character extends SpriteComponent
    with HasGameReference<MainGame> {
  late TextComponent text;
  late Vector2 coordinate;
  final dynamic gameParam;
  final String name;
  KeyInputType currentCharacterDirection = KeyInputType.right;
  SpriteFacing currentSpriteFacing = SpriteFacing.right;

  moveTo(KeyInputType direction);


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
