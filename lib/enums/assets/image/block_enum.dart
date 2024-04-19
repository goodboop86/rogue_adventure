import 'package:rogue_adventure/enums/assets/image/common_enum.dart';

enum BlockEnum {
  floor1(
    0,
    ImageTypeEnum.floorBlock,
    {
      "path": "images/block/floor/floor1.png",
      "sprite_size": [32, 32],
    },
  ),
  floor2(
    1,
    ImageTypeEnum.floorBlock,
    {
      "path": "images/block/floor/floor32.png",
      "sprite_size": [32, 32],
    },
  ),
  floor3(
    2,
    ImageTypeEnum.floorBlock,
    {
      "path": "images/block/floor/floor3.png",
      "sprite_size": [32, 32],
    },
  ),
  wall1(
    0,
    ImageTypeEnum.wallBlock,
    {
      "path": "images/block/wall/wall1.png",
      "sprite_size": [32, 32],
    },
  ),
  wall2(
    1,
    ImageTypeEnum.wallBlock,
    {
      "path": "images/block/wall/wall2.png",
      "sprite_size": [32, 32],
    },
  ),
  wall3(
    2,
    ImageTypeEnum.wallBlock,
    {
      "path": "images/block/wall/wall3.png",
      "sprite_size": [32, 32],
    },
  );

  final int id;
  final ImageTypeEnum imageType;
  final Map<String, dynamic> assetParam;

  const BlockEnum(
    this.id,
    this.imageType,
    this.assetParam,
  );
}
