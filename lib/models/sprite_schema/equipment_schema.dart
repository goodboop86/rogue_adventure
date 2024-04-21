import 'package:rogue_adventure/models/sprite_schema/sprite_schema.dart';

class EquipmentSchema extends SpriteSchema {
  EquipmentSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class AccessorySchema extends EquipmentSchema {
  AccessorySchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class ShieldSchema extends EquipmentSchema {
  ShieldSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}

class WeaponSchema extends EquipmentSchema {
  WeaponSchema(
      {required super.id,
      required super.path,
      required super.spriteWidth,
      required super.spriteHeight});
}
