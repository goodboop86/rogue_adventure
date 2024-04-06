import 'dart:ui';

import 'package:flame/components.dart';

enum BlockType {
  floor(0, 'floor.png'),
  wall(1, 'wall.png'),
  player(2, 'player.png');

  final int id;
  final String assetName;
  const BlockType(this.id, this.assetName);

  static BlockType fromId(int id) {
    return BlockType.values.firstWhere((element) => element.id == id);
  }

  static Future<Map<int, Sprite>> getAllSpriteMap() async {
    final Map<int, Sprite> spriteMap = {};
    for (final blockType in BlockType.values) {
      spriteMap[blockType.id] = await Sprite.load(blockType.assetName);
    }
    return spriteMap;
  }
}
