import 'package:rogue_adventure/models/sprite_schema/sprite_schema.dart';

class ItemSchema extends SpriteSchema {
  ItemSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class FoodSchema extends ItemSchema {
  FoodSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class ScrollSchema extends ItemSchema {
  ScrollSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class WeedSchema extends ItemSchema {
  WeedSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}
