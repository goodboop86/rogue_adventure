
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:rogue_adventure/entities/field.dart';
import 'package:rogue_adventure/systems/block_type.dart';

import '../components/blocks/blocks.dart';
import '../components/hud/hud_direction_button.dart';
import '../components/blocks/player.dart';
import '../systems/config.dart';

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {
  late Player player;
  late Sprite playerSprite;

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
    playerSprite = await Sprite.load('player.png');

    await createFloor();

    await createPlayer();

    await createHud();

    camera.follow(player);
  }

  createFloor() async {
    Map<int, Sprite> spriteMap = await BlockType.getAllSpriteMap();
    List<List<int>> floorList = floor;
    for(int i = 0; i < floorList.length; i++) {
      for (int j =0; j < floorList[i].length; j++) {
        int blockId = floorList[i][j];
        final component = Blocks.create(
          size: Vector2.all(oneBlockSize),
          sprite: spriteMap[blockId],
          position: Vector2(j * oneBlockSize,  i *  oneBlockSize),
          anchor: Anchor.center,
          coordinate: Vector2(j.toDouble(),i.toDouble()),
          blockType: BlockType.fromId(blockId),
        );
        world.add(component);
      }
    }
  }

  Vector2 pos = Vector2(6, 4);
  createPlayer() {
    player = Player(
      size: Vector2.all(oneBlockSize),
      sprite: playerSprite,
      position: Vector2(pos.x * oneBlockSize,  pos.y *  oneBlockSize),
      anchor: Anchor.center,
      coordinate: pos,
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
