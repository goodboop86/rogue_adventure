import 'package:rogue_adventure/models/sprite_schema/sprite_schema.dart';

class UISchema extends SpriteSchema {
  UISchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class ButtonSchema extends UISchema {
  ButtonSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class EffectSchema extends UISchema {
  EffectSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class IconSchema extends UISchema {
  IconSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}
