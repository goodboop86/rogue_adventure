import 'package:rogue_adventure/systems/assets/image/common_type.dart';
import 'package:rogue_adventure/systems/config.dart';

enum UIType {
  inventoryButton(800, SpriteSubCategoryType.buttonUI, "ui/button/inventory_button.png", {
    "sprite_size": [64.0, 64.0],
    "src_size": [64.0, 64.0]
  }, {}),
  button1(801, SpriteSubCategoryType.buttonUI, "ui/button/button2.png", {
    "sprite_size": [64.0, 64.0],
    "src_size": [64.0, 64.0]
  }, {}),
  button2(802, SpriteSubCategoryType.buttonUI, "ui/button/button3.png", {
    "sprite_size": [64.0, 64.0],
    "src_size": [64.0, 64.0]
  }, {}),
  effect0(850, SpriteSubCategoryType.effectUI, "ui/effect/effect1.png", {
    "sprite_size": [64.0, 64.0],
    "src_size": [64.0, 64.0]
  }, {}),
  effect1(851, SpriteSubCategoryType.effectUI, "ui/effect/effect2.png", {
    "sprite_size": [64.0, 64.0],
    "src_size": [64.0, 64.0]
  }, {}),
  effect2(852, SpriteSubCategoryType.effectUI, "ui/effect/effect3.png", {
    "sprite_size": [64.0, 64.0],
    "src_size": [64.0, 64.0]
  }, {}),
  heart(900, SpriteSubCategoryType.iconUI, "ui/icon/heart.png", {
    "sprite_size": [64.0, 64.0],
    "src_size": [iconUISrcSize, iconUISrcSize]
  }, {}),
  sword(901, SpriteSubCategoryType.iconUI, "ui/icon/sword.png", {
    "sprite_size": [64.0, 64.0],
    "src_size": [iconUISrcSize, iconUISrcSize]
  }, {}),
  scroll(902, SpriteSubCategoryType.iconUI, "ui/icon/script.png", {
    "sprite_size": [16.0, 64.0],
    "src_size": [iconUISrcSize, iconUISrcSize]
  }, {});

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
