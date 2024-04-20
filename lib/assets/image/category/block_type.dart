import 'package:rogue_adventure/assets/image/common_type.dart';

enum BlockType {
  floor0(
    0,
    SpriteSubCategoryType.floorBlock,
    "block/floor/floor1.png",
    {
      "sprite_size": [64.0, 64.0],
    },{}
  ),
  floor1(
    1,
    SpriteSubCategoryType.floorBlock,
    "block/floor/floor2.png",
    {
      "sprite_size": [64.0, 64.0],
    },{}
  ),
  floor2(
    2,
    SpriteSubCategoryType.floorBlock,
    "block/floor/floor3.png",
    {
      "sprite_size": [64.0, 64.0],
    },{}
  ),
  wall0(
    50,
    SpriteSubCategoryType.wallBlock,
    "block/wall/wall1.png",
    {
      "sprite_size": [64.0, 64.0],
    },{}
  ),
  wall1(
    51,
    SpriteSubCategoryType.wallBlock,
    "block/wall/wall2.png",
    {
    "sprite_size": [64.0, 64.0],
    },{}
  ),
  wall2(
    52,
    SpriteSubCategoryType.wallBlock,
    "block/wall/wall3.png",
    {
      "sprite_size": [64.0, 64.0],
    },{}
  );

  final int id;
  final SpriteSubCategoryType spriteSubCategory;
  final String spritePath;
  final Map<String, dynamic> assetParam;
  final Map<String, dynamic> gameParam;
  final SpriteCategoryType myType = SpriteCategoryType.block;

  const BlockType(this.id,
      this.spriteSubCategory,
      this.spritePath,
      this.assetParam,
      this.gameParam);
}



