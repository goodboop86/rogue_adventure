import 'package:flame/components.dart';

import 'blocks.dart';

class Floor extends Blocks {
  final bool isWalkable = true;

  Floor({
    required super.sprite,
    required super.size,
    required super.gameParam,
  });
}