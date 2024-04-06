import 'package:flame/components.dart';

import 'blocks.dart';

class Floor extends Blocks {
  final bool isWalkable = true;
  late ({int x, int y}) coordinate;

  Floor({
    required super.size,
    required super.sprite,
    required super.position,
    required super.anchor,
    required this.coordinate,
  });

}