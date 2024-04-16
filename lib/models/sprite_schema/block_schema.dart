import 'package:rogue_adventure/models/sprite_schema/sprite_schema.dart';

class BlockSchema extends SpriteSchema {
  BlockSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class FloorSchema extends SpriteSchema {
  FloorSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class WallSchema extends SpriteSchema {
  WallSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}
