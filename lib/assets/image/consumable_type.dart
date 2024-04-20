import 'package:rogue_adventure/assets/image/common_type.dart';

enum ConsumableType {
  food1(
      0, SpriteSubCategoryType.foodConsumable, "images/consumable/food/food1.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.foodConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/consumable/food/food1.png",
    "sprite_size": [32, 32],
  }),
  food2(
      1, SpriteSubCategoryType.foodConsumable, "images/consumable/food/food2.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.foodConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/consumable/food/food2.png",
    "sprite_size": [32, 32],
  }),
  food3(
      2, SpriteSubCategoryType.foodConsumable, "images/consumable/food/food3.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.foodConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/consumable/food/food3.png",
    "sprite_size": [32, 32],
  }),
  scroll1(0, SpriteSubCategoryType.scrollConsumable,
      "images/consumable/scroll/scroll1.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.scrollConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/consumable/scroll/scroll1.png",
    "sprite_size": [32, 32],
  }),
  scroll2(1, SpriteSubCategoryType.scrollConsumable,
      "images/consumable/scroll/scroll2.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.scrollConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/consumable/scroll/scroll2.png",
    "sprite_size": [32, 32],
  }),
  scroll3(2, SpriteSubCategoryType.scrollConsumable,
      "images/consumable/scroll/scroll3.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.scrollConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/consumable/scroll/scroll3.png",
    "sprite_size": [32, 32],
  }),
  weed1(0, SpriteSubCategoryType.weedConsumable,
      "images/consumable/weed/scroll1.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.weedConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/consumable/weed/scroll1.png",
    "sprite_size": [32, 32],
  }),
  weed2(1, SpriteSubCategoryType.weedConsumable,
      "images/consumable/weed/scroll2.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.weedConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/consumable/weed/scroll2.png",
    "sprite_size": [32, 32],
  }),
  weed3(2, SpriteSubCategoryType.weedConsumable,
      "images/consumable/weed/scroll3.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.weedConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/consumable/weed/scroll3.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final SpriteSubCategoryType spriteSubType;
  final String spritePath;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;
  final SpriteCategoryType myType = SpriteCategoryType.consumable;

  const ConsumableType(
    this.id,
    this.spriteSubType,
    this.spritePath,
    this.gameParam,
    this.assetParam,
  );
}
