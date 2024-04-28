import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:rogue_adventure/main_game_page.dart';
import 'package:rogue_adventure/pages/page.dart';


class InventoryPage extends Page with HasGameRef<GameRouter> {

  @override
  Future<void> onLoad() async {
    await assets.loadAssets();
    super.onLoad();

    await construct();

  }

  @override
  Future<void> construct() async {
    await createUI();
  }

  createUI() async {
    double gameWidth = game.size.x;
    double gameHeight = game.size.y;
    int ratioOfGameSize = 16;
    double section = gameWidth / ratioOfGameSize;

    Sprite inventoryButtonSprite = assets.getSpriteEntityFromID(id: 800).sprite;
    SpriteButtonComponent inventoryButton = SpriteButtonComponent(
      priority: 1,
      button: inventoryButtonSprite,
      buttonDown: inventoryButtonSprite,
    )
      ..position = Vector2(game.size.x/2 - section * 2, game.size.y/2 - section * 2)
      ..size = Vector2.all(section*2)
      ..onPressed = () {

      };
    add(inventoryButton);
  }
  InventoryPage({required super.worldManager});
}

