import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';

import 'blocks.dart';

class Floor extends Blocks {
  final bool isWalkable = true;

  Floor({
    required super.size,
    required super.sprite,
    required super.position,
    required super.anchor,
    required super.coordinate,
  });

}