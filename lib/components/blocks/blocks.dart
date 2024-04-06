//import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';
import 'package:rogue_adventure/components/blocks/floor.dart';
import 'package:rogue_adventure/components/blocks/wall.dart';

import '../../systems/block_type.dart';

class Blocks extends SpriteComponent with HasGameRef{
  late Vector2 coordinate;
  late TextComponent text;

  get getCoordinate => coordinate;

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
    required super.size,
    required super.sprite,
    required super.position,
    required super.anchor,
    required this.coordinate,
  });


  factory Blocks.create({required size, required sprite, required position, required anchor, required coordinate, required blockType}) {

    switch(blockType) {
      case BlockType.floor:
        return Floor(size: size, sprite: sprite, position: position, anchor: anchor, coordinate: coordinate);
      case BlockType.wall:
        return Wall(size: size, sprite: sprite, position: position, anchor: anchor, coordinate: coordinate);
      default:
        throw Exception();

    }
  }
}