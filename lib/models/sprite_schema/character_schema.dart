import 'package:rogue_adventure/models/sprite_schema/sprite_schema.dart';

class CharacterSchema extends SpriteSchema {
  CharacterSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class BaseParams {
  late int hp;
  late int ep;
  late int atk;
  late int def;
}

class PlayerSchema extends CharacterSchema {
  late BaseParams params;

  PlayerSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight,
      required this.params});
}

class EnemySchema extends CharacterSchema {
  late BaseParams params;

  EnemySchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight,
      required this.params});
}

class NPCSchema extends CharacterSchema {
  NPCSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}
