import 'package:rogue_adventure/assets/image/common_type.dart';

enum UIType {
  button0(800, SpriteSubCategoryType.buttonUI, "ui/button/button1.png",{
    "sprite_size": [32.0, 32.0],
  },{}),
  button1(801, SpriteSubCategoryType.buttonUI, "ui/button/button2.png", {
    "sprite_size": [32.0, 32.0],
  },{}),
  button2(802, SpriteSubCategoryType.buttonUI, "ui/button/button3.png", {
    "sprite_size": [32.0, 32.0],
  },{}),
  effect0(850, SpriteSubCategoryType.effectUI, "ui/effect/effect1.png", {
    "sprite_size": [32.0, 32.0],
  },{}),
  effect1(851, SpriteSubCategoryType.effectUI, "ui/effect/effect2.png", {
    "sprite_size": [32.0, 32.0],
  },{}),
  effect2(852, SpriteSubCategoryType.effectUI, "ui/effect/effect3.png", {
    "sprite_size": [32.0, 32.0],
  },{}),
  icon0(900, SpriteSubCategoryType.iconUI, "ui/icon/icon1.png", {
    "sprite_size": [32.0, 32.0],
  },{}),
  icon1(901, SpriteSubCategoryType.iconUI, "ui/icon/icon2.png", {
    "sprite_size": [32.0, 32.0],
  },{}),
  icon2(902, SpriteSubCategoryType.iconUI, "ui/icon/icon3.png", {
    "sprite_size": [32.0, 32.0],
  },{});

  final int id;
  final SpriteSubCategoryType spriteSubCategory;
  final String spritePath;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;
  final SpriteCategoryType myType = SpriteCategoryType.ui;

  const UIType(
    this.id,
    this.spriteSubCategory,
    this.spritePath,

    this.assetParam,
      this.gameParam,
  );
}
