import 'package:rogue_adventure/assets/image/common_type.dart';

enum EquipmentType {
  accessory1(0, SpriteSubCategoryType.accessoryEquipment,
      "images/equipment/accessory/accessory1.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.accessoryEquipment,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/equipment/accessory/accessory1.png",
    "sprite_size": [32, 32],
  }),
  accessory2(1, SpriteSubCategoryType.accessoryEquipment,
      "images/equipment/accessory/accessory2.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.accessoryEquipment,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/equipment/accessory/accessory2.png",
    "sprite_size": [32, 32],
  }),
  accessory3(2, SpriteSubCategoryType.accessoryEquipment,
      "images/equipment/accessory/accessory3.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.accessoryEquipment,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/equipment/accessory/accessory3.png",
    "sprite_size": [32, 32],
  }),
  weapon1(0, SpriteSubCategoryType.weaponEquipment,
      "images/equipment/weapon/weapon1.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.weaponEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "path": "images/equipment/weapon/weapon1.png",
        "sprite_size": [32, 32],
      }),
  weapon2(1, SpriteSubCategoryType.weaponEquipment,
      "images/equipment/weapon/weapon2.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.weaponEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "path": "images/equipment/weapon/weapon2.png",
        "sprite_size": [32, 32],
      }),
  weapon3(2, SpriteSubCategoryType.weaponEquipment,
      "images/equipment/weapon/weapon3.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.weaponEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "path": "images/equipment/weapon/weapon3.png",
        "sprite_size": [32, 32],
      }),
  shield1(0, SpriteSubCategoryType.shieldEquipment,
      "images/equipment/shield/shield1.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.shieldEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "path": "images/equipment/shield/shield1.png",
        "sprite_size": [32, 32],
      }),
  shield2(1, SpriteSubCategoryType.shieldEquipment,
      "images/equipment/shield/shield2.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.shieldEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "path": "images/equipment/shield/shield2.png",
        "sprite_size": [32, 32],
      }),
  shield3(2, SpriteSubCategoryType.shieldEquipment,
      "images/equipment/shield/shield3.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.shieldEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "path": "images/equipment/shield/shield3.png",
        "sprite_size": [32, 32],
      });


  final int id;
  final SpriteSubCategoryType spriteSubType;
  final String spritePath;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;
  final SpriteCategoryType myType = SpriteCategoryType.equipment;

  const EquipmentType(
    this.id,
    this.spriteSubType,
    this.spritePath,
    this.gameParam,
    this.assetParam,
  );
}