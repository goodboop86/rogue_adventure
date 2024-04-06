import 'dart:ui';

import 'package:flame/components.dart';
import 'package:rogue_adventure/components/blocks/floor.dart';
import 'package:rogue_adventure/components/blocks/wall.dart';

import '../../systems/block_type.dart';

class Blocks extends SpriteComponent with HasGameRef{

  Blocks({
    required super.size,
    required super.sprite,
    required super.position,
    required super.anchor,
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