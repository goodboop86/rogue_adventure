
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:rogue_adventure/utils/config.dart';

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final blockSprite = await Sprite.load('block.png');
    final goalSprite = await Sprite.load('goal.png');

    SpriteComponent block = SpriteComponent(
      size: Vector2.all(oneBlockSize),
      sprite: blockSprite,
      position: Vector2(oneBlockSize, oneBlockSize),
    );

    add(block);
  }
}
