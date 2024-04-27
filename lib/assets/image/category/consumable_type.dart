import 'package:rogue_adventure/assets/image/common_type.dart';

enum ConsumableType {
  food1(
      400, SpriteSubCategoryType.foodConsumable, "consumable/food/food1.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.foodConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [64.0, 64.0], "src_size": [64.0, 64.0]
  }),
  food2(
      401, SpriteSubCategoryType.foodConsumable, "consumable/food/food2.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.foodConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [64.0, 64.0], "src_size": [64.0, 64.0]
  }),
  food3(
      402, SpriteSubCategoryType.foodConsumable, "consumable/food/food3.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.foodConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [64.0, 64.0], "src_size": [64.0, 64.0]
  }),
  scroll0(450, SpriteSubCategoryType.scrollConsumable,
      "consumable/scroll/scroll1.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.scrollConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [64.0, 64.0], "src_size": [64.0, 64.0]
  }),
  scroll1(451, SpriteSubCategoryType.scrollConsumable,
      "consumable/scroll/scroll2.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.scrollConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [64.0, 64.0], "src_size": [64.0, 64.0]
  }),
  scroll2(452, SpriteSubCategoryType.scrollConsumable,
      "consumable/scroll/scroll3.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.scrollConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [64.0, 64.0], "src_size": [64.0, 64.0]
  }),
  weed0(500, SpriteSubCategoryType.weedConsumable,
      "consumable/weed/weed1.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.weedConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [64.0, 64.0], "src_size": [64.0, 64.0]
  }),
  weed1(501, SpriteSubCategoryType.weedConsumable,
      "consumable/weed/weed2.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.weedConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [64.0, 64.0], "src_size": [64.0, 64.0]
  }),
  weed2(502, SpriteSubCategoryType.weedConsumable,
      "consumable/weed/weed3.png", {
    "price": 10,
    "heal": 10,
    "type": SpriteSubCategoryType.weedConsumable,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [64.0, 64.0], "src_size": [64.0, 64.0]
  });

  final int id;
  final SpriteSubCategoryType spriteSubCategory;
  final String spritePath;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;
  final SpriteCategoryType myType = SpriteCategoryType.consumable;

  const ConsumableType(
    this.id,
    this.spriteSubCategory,
    this.spritePath,
    this.gameParam,
    this.assetParam,
  );
}
