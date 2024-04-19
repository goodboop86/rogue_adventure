import 'package:rogue_adventure/enums/assets/image/common_enum.dart';

enum AccessoryEnum {
  accessory1(0, ImageTypeEnum.accessoryEquipment, {
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.accessoryEquipment,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/equipment/accessory/accessory1.png",
    "sprite_size": [32, 32],
  }),
  accessory2(1, ImageTypeEnum.accessoryEquipment, {
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.accessoryEquipment,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/equipment/accessory/accessory2.png",
    "sprite_size": [32, 32],
  }),
  accessory3(2, ImageTypeEnum.accessoryEquipment, {
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.accessoryEquipment,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/equipment/accessory/accessory3.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final ImageTypeEnum imageType;

  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;

  const AccessoryEnum(
    this.id,
    this.imageType,
    this.gameParam,
    this.assetParam,
  );
}

enum WeaponEnum {
  weapon1(0, ImageTypeEnum.weaponEquipment, {
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.weaponEquipment,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/equipment/weapon/weapon1.png",
    "sprite_size": [32, 32],
  }),
  weapon2(1, ImageTypeEnum.weaponEquipment, {
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.weaponEquipment,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/equipment/weapon/weapon2.png",
    "sprite_size": [32, 32],
  }),
  weapon3(2, ImageTypeEnum.weaponEquipment, {
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.weaponEquipment,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/equipment/weapon/weapon3.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final ImageTypeEnum imageType;

  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;

  const WeaponEnum(
    this.id,
    this.imageType,
    this.gameParam,
    this.assetParam,
  );
}

enum ShieldEnum {
  shield1(0, ImageTypeEnum.shieldEquipment, {
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.shieldEquipment,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/equipment/shield/shield1.png",
    "sprite_size": [32, 32],
  }),
  shield2(1, ImageTypeEnum.shieldEquipment, {
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.shieldEquipment,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/equipment/shield/shield2.png",
    "sprite_size": [32, 32],
  }),
  shield3(2, ImageTypeEnum.shieldEquipment, {
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.shieldEquipment,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/equipment/shield/shield3.png",
    "sprite_size": [32, 32],
  });

  final int id;

  final ImageTypeEnum imageType;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;

  const ShieldEnum(
    this.id,
    this.imageType,
    this.gameParam,
    this.assetParam,
  );
}
