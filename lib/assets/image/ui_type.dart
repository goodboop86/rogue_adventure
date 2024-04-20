import 'package:rogue_adventure/assets/image/common_type.dart';

enum UIType {
  button1(0, SpriteSubCategoryType.buttonUI, "images/ui/button/button1.png", {
    "path": "images/ui/button/button1.png",
    "sprite_size": [32, 32],
  }),
  button2(1, SpriteSubCategoryType.buttonUI, "images/ui/button/button2.png", {
    "path": "images/ui/button/button2.png",
    "sprite_size": [32, 32],
  }),
  button3(2, SpriteSubCategoryType.buttonUI, "images/ui/button/button3.png", {
    "path": "images/ui/button/button3.png",
    "sprite_size": [32, 32],
  }),
  effect1(0, SpriteSubCategoryType.effectUI, "images/ui/effect/effect1.png", {
    "path": "images/ui/effect/effect1.png",
    "sprite_size": [32, 32],
  }),
  effect2(1, SpriteSubCategoryType.effectUI, "images/ui/effect/effect2.png", {
    "path": "images/ui/effect/effect2.png",
    "sprite_size": [32, 32],
  }),
  effect3(2, SpriteSubCategoryType.effectUI, "images/ui/effect/effect3.png", {
    "path": "images/ui/effect/effect3.png",
    "sprite_size": [32, 32],
  }),
  icon1(0, SpriteSubCategoryType.iconUI, "images/ui/icon/icon1.png", {
    "path": "images/ui/icon/icon1.png",
    "sprite_size": [32, 32],
  }),
  icon2(1, SpriteSubCategoryType.iconUI, "images/ui/icon/icon2.png", {
    "path": "images/ui/icon/icon2.png",
    "sprite_size": [32, 32],
  }),
  icon3(2, SpriteSubCategoryType.iconUI, "images/ui/icon/icon3.png", {
    "path": "images/ui/icon/icon3.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final SpriteSubCategoryType spriteSubType;
  final String spritePath;
  final Map<String, dynamic> assetParam;
  final SpriteCategoryType myType = SpriteCategoryType.ui;

  const UIType(
    this.id,
    this.spriteSubType,
    this.spritePath,
    this.assetParam,
  );
}
