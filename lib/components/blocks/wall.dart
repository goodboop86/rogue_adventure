
import 'blocks.dart';

class Wall extends Blocks {
  final bool isWalkable = false;
  late ({int x, int y}) coordinate;

  Wall({
    required super.size,
    required super.sprite,
    required super.position,
    required super.anchor,
    required this.coordinate,
  });

}