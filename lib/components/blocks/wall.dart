

import 'blocks.dart';

class Wall extends Blocks {
  final bool isWalkable = false;

  Wall({
    required super.sprite,
    required super.size,
    required super.gameParam,
  });
}