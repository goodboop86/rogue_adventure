import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:rogue_adventure/main_game_page.dart';
import 'package:rogue_adventure/pages/page.dart';

class StartPage extends Page with HasGameRef<GameRouter> {
  late WorldManager worldManager;
  @override
  Future<void> onLoad() async {
    game.world = worldManager.getWorldFromName(name: 'start');

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
      button: inventoryButtonSprite,
      buttonDown: inventoryButtonSprite,
    )
      ..position = Vector2(game.size.x/2 - section/2, game.size.y/2 - section/2)
      ..size = Vector2.all(section)
      ..onPressed = () {
        game.world = worldManager.getWorldFromName(name: 'dungeon');
      game.router.pushNamed('dungeon');};
    add(inventoryButton);
  }

  StartPage({required this.worldManager}){
  }
}
