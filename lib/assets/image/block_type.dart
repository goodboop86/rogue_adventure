import 'package:rogue_adventure/assets/image/common_type.dart';

enum BlockType {
  floor1(
    0,
    SpriteSubCategoryType.floorBlock,
    "images/block/floor/floor1.png",
    {
      "path": "images/block/floor/floor1.png",
      "sprite_size": [32, 32],
    },
  ),
  floor2(
    1,
    SpriteSubCategoryType.floorBlock,
    "images/block/floor/floor32.png",
    {
      "path": "images/block/floor/floor32.png",
      "sprite_size": [32, 32],
    },
  ),
  floor3(
    2,
    SpriteSubCategoryType.floorBlock,
    "images/block/floor/floor3.png",
    {
      "path": "images/block/floor/floor3.png",
      "sprite_size": [32, 32],
    },
  ),
  wall1(
    0,
    SpriteSubCategoryType.wallBlock,
    "images/block/wall/wall2.png",
    {
      "path": "images/block/wall/wall1.png",
      "sprite_size": [32, 32],
    },
  ),
  wall2(
    1,
    SpriteSubCategoryType.wallBlock,
    "images/block/wall/wall2.png",
    {
    "path": "images/block/wall/wall2.png",
    "sprite_size": [32, 32],
    },
  ),
  wall3(
    2,
    SpriteSubCategoryType.wallBlock,
    "images/block/wall/wall3.png",
    {
      "path": "images/block/wall/wall3.png",
      "sprite_size": [32, 32],
    },
  );

  final int id;
  final SpriteSubCategoryType spriteSubType;
  final String spritePath;
  final Map<String, dynamic> assetParam;

  const BlockType(this.id,
      this.spriteSubType,
      this.spritePath,
      this.assetParam,);
}



