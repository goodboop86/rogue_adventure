
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame/text.dart';

import 'blocks.dart';

class Wall extends Blocks {
  final bool isWalkable = false;
  late Vector2 coordinate;

  late TextComponent text;

  @override
  void onLoad() {
    text = TextComponent(
      text: '$coordinate',
      textRenderer: TextPaint(
        style: TextStyle(
          fontSize: 8.0,
          color: BasicPalette.white.color,
        ),
      ),
      position: Vector2.all(0.0),
    );
    add(text);
    super.onLoad();
  }

  Wall({
    required super.size,
    required super.sprite,
    required super.position,
    required super.anchor,
    required this.coordinate,
  });

}