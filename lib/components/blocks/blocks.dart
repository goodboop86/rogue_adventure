//import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';
import 'package:rogue_adventure/assets/image/loader.dart';
import 'package:rogue_adventure/components/blocks/floor.dart';
import 'package:rogue_adventure/components/blocks/wall.dart';
import 'package:rogue_adventure/assets/image/common_type.dart';


abstract class Blocks extends SpriteComponent with HasGameRef {
  late Vector2 coordinate;
  late TextComponent text;
  late SpriteEntity entity;
  late Map<String, dynamic> gameParam;


  @override
  void onLoad() {
    text = TextComponent(
      text: '$coordinate',
      textRenderer: TextPaint(
        style: TextStyle(
          fontSize: 8.0,
          color: BasicPalette.white.color,
        ),
      ),
      position: Vector2.all(0.0),
    );
    add(text);
    super.onLoad();
  }

  Blocks({
    required super.sprite,
    required super.size,
    required this.gameParam,
  });


  factory Blocks.initialize({required SpriteEntity entity}) {
    List<double> spriteSize = entity.assetParam['sprite_size'];
    Vector2 size = Vector2(spriteSize[0], spriteSize[1]);

    switch (entity.spriteSubCategory) {
      case SpriteSubCategoryType.floorBlock:
        return Floor(
            sprite: entity.sprite,
            size: size,
            gameParam: entity.gameParam,);
      case SpriteSubCategoryType.wallBlock:
        return Wall(
            sprite: entity.sprite,
            size: size,
            gameParam: entity.gameParam,);
      default:
        throw Exception();
    }
  }
}
