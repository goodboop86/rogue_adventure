import 'package:rogue_adventure/enums/assets/image/common_enum.dart';

enum FoodEnum {
  food1(0, ImageTypeEnum.foodConsumable,{
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.foodConsumable,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/consumable/food/food1.png",
    "sprite_size": [32, 32],
  }),
  food2(1, ImageTypeEnum.foodConsumable,{
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.foodConsumable,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/consumable/food/food2.png",
    "sprite_size": [32, 32],
  }),
  food3(2, ImageTypeEnum.foodConsumable,{
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.foodConsumable,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/consumable/food/food3.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final ImageTypeEnum imageType;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;

  const FoodEnum(
    this.id,
      this.imageType,

    this.gameParam,
    this.assetParam,
  );
}

enum ScrollEnum {
  scroll1(0, ImageTypeEnum.scrollConsumable,{
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.scrollConsumable,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/consumable/scroll/scroll1.png",
    "sprite_size": [32, 32],
  }),
  scroll2(1, ImageTypeEnum.scrollConsumable,{
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.scrollConsumable,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/consumable/scroll/scroll2.png",
    "sprite_size": [32, 32],
  }),
  scroll3(2, ImageTypeEnum.scrollConsumable,{
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.scrollConsumable,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/consumable/scroll/scroll3.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final ImageTypeEnum imageType;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;

  const ScrollEnum(this.id,
      this.imageType,
      this.gameParam, this.assetParam);
}

enum WeedEnum {
  weed1(0, ImageTypeEnum.weedConsumable,{
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.weedConsumable,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/consumable/weed/scroll1.png",
    "sprite_size": [32, 32],
  }),
  weed2(1, ImageTypeEnum.weedConsumable,{
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.weedConsumable,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/consumable/weed/scroll2.png",
    "sprite_size": [32, 32],
  }),
  weed3(2,ImageTypeEnum.weedConsumable, {
    "price": 10,
    "heal": 10,
    "type": ImageTypeEnum.weedConsumable,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/consumable/weed/scroll3.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final ImageTypeEnum imageType;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;

  const WeedEnum(
    this.id,
      this.imageType,

    this.gameParam,
    this.assetParam,
  );
}
