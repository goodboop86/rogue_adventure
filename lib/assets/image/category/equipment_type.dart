import 'package:rogue_adventure/assets/image/common_type.dart';

enum EquipmentType {
  accessory0(600, SpriteSubCategoryType.accessoryEquipment,
      "equipment/accessory/accessory1.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.accessoryEquipment,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [32.0, 32.0],
  }),
  accessory1(601, SpriteSubCategoryType.accessoryEquipment,
      "equipment/accessory/accessory2.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.accessoryEquipment,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [32.0, 32.0],
  }),
  accessory2(602, SpriteSubCategoryType.accessoryEquipment,
      "equipment/accessory/accessory3.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.accessoryEquipment,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [32.0, 32.0],
  }),
  weapon0(650, SpriteSubCategoryType.weaponEquipment,
      "equipment/weapon/weapon1.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.weaponEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "sprite_size": [32.0, 32.0],
      }),
  weapon1(651, SpriteSubCategoryType.weaponEquipment,
      "equipment/weapon/weapon2.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.weaponEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "sprite_size": [32.0, 32.0],
      }),
  weapon2(652, SpriteSubCategoryType.weaponEquipment,
      "equipment/weapon/weapon3.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.weaponEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "sprite_size": [32.0, 32.0],
      }),
  shield0(700, SpriteSubCategoryType.shieldEquipment,
      "equipment/shield/shield1.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.shieldEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "sprite_size": [32.0, 32.0],
      }),
  shield1(701, SpriteSubCategoryType.shieldEquipment,
      "equipment/shield/shield2.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.shieldEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "sprite_size": [32.0, 32.0],
      }),
  shield2(702, SpriteSubCategoryType.shieldEquipment,
      "equipment/shield/shield3.png", {
        "price": 10,
        "heal": 10,
        "type": SpriteSubCategoryType.shieldEquipment,
        "rarity": RarityType.common,
        "how_ease": HowEaseType.easy,
        "theme": ThemeType.basic
      }, {
        "sprite_size": [32.0, 32.0],
      });


  final int id;
  final SpriteSubCategoryType spriteSubCategory;
  final String spritePath;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;
  final SpriteCategoryType myType = SpriteCategoryType.equipment;

  const EquipmentType(
    this.id,
    this.spriteSubCategory,
    this.spritePath,
    this.gameParam,
    this.assetParam,
  );
}