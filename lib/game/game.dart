
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:rogue_adventure/entities/field.dart';

import '../components/hud_direction_button.dart';
import '../components/player.dart';
import '../systems/config.dart';

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {
  late Map<int, Sprite> _spriteMap;
  late Player player;
  @override
  bool debugMode = true;
  //late double oneBlockSize = 64.0;

  @override
  void onGameResize(Vector2 canvasSize) {
    //oneBlockSize = canvasSize.x / 16;
    super.onGameResize(canvasSize);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final floorSprite = await Sprite.load('floor.png');
    final blockSprite = await Sprite.load('wall.png');
    final playerSprite = await Sprite.load('player.png');

    _spriteMap = {
      0 : floorSprite,
      1 : blockSprite,
      2 : playerSprite,
    };

    createFloor();

    createPlayer();

    createHud();

    camera.follow(player);
  }

  createFloor() {
    List<List<int>> floorList = floor;
    for(int i = 0; i < floorList.length; i++) {
      for (int j =0; j < floorList[i].length; j++) {
        final component = SpriteComponent(
          size: Vector2.all(oneBlockSize),
          sprite: _spriteMap[floorList[i][j]],
          position: Vector2(j * oneBlockSize,  i *  oneBlockSize),
          anchor: Anchor.center,
        );
        world.add(component);
      }
    }
  }

  createPlayer() {
    player = Player(
      size: Vector2.all(oneBlockSize),
      sprite: _spriteMap[2],
      position: Vector2(6 * oneBlockSize,  4 *  oneBlockSize),
      anchor: Anchor.center,
    );
    world.add(player);
  }

  createHud() async {
    List<HudButtonComponent> hudButtons = await HudDirectionButtons(screenSize: camera.viewport.size).getHudDirectionButtons(player);
    PositionComponent hudButton = PositionComponent(
        children: hudButtons,
        anchor: Anchor.bottomLeft
    );
    this.camera.viewport.add(hudButton);
  }

  @override
  void onMount() {
    //camera.follow(player);
    super.onMount();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    //print(camera.viewport.size);
  }

  MainGame({required camera}) : super(camera: camera);
}
