import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
import 'package:rogue_adventure/systems/config.dart';

class Block extends SpriteComponent with HasGameRef{


  @override
  Future<void> onLoad() async {
    super.onLoad();
  }

  @override
  onGameResize(Vector2 canvasSize) {
    debugPrint('canvasSize: $canvasSize');
    size = Vector2.all(canvasSize.x / 16);
    position = position * canvasSize.x / 16;
    super.onGameResize(canvasSize);
  }

  Block()
      : super(
    size: Vector2.all(oneBlockSize),
  );

}