
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:rogue_adventure/utils/config.dart';
import 'package:rogue_adventure/entities/field.dart';

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {
  late Map<int, Sprite> _spriteMap;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final floorSprite = await Sprite.load('floor.png');
    final blockSprite = await Sprite.load('block.png');
    final playerSprite = await Sprite.load('player.png');

    List<List<int>> floorList = floor;

    _spriteMap = {
      0 : floorSprite,
      1 : blockSprite,
      2 : playerSprite,
    };

    for(int i = 0; i < floorList.length; i++) {
      for (int j =0; j < floorList[i].length; j++) {
        final component = SpriteComponent(
          size: Vector2.all(oneBlockSize),
          sprite: _spriteMap[floorList[i][j]],
          position: Vector2(j * oneBlockSize,  i *  oneBlockSize),
        );
        add(component);
      }
    }
  }
}
