//import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';
import 'package:rogue_adventure/components/blocks/floor.dart';
import 'package:rogue_adventure/components/blocks/wall.dart';
import 'package:rogue_adventure/assets/image/block_type.dart';
import 'package:rogue_adventure/assets/image/common_type.dart';

import '../../enums/component/block_type.dart';

abstract class Blocks extends SpriteComponent with HasGameRef{
  late Vector2 coordinate;
  late TextComponent text;
  late BlockType blockEnum;

  get getCoordinate => coordinate;

  void initialize();

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
    required this.blockEnum
  });


  factory Blocks.create({required size, required sprite, required position, required anchor, required coordinate, required blockType}) {

    switch(blockType) {
      case BlockType.floor:
      case BlockType.wall:
      default:
        throw Exception();

    }
  }

  factory Blocks.initialize({required BlockType blockEnum}) {

    switch(blockEnum.spriteSubType) {
      case SpriteSubCategoryType.floorBlock:
        return Floor(blockEnum: blockEnum);
      case SpriteSubCategoryType.wallBlock:
        return Wall(blockEnum: blockEnum);
      default:
        throw Exception();

    }
  }
}