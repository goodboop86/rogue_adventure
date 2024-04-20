
import 'dart:convert';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:rogue_adventure/assets/image/common_type.dart';
import 'package:rogue_adventure/assets/image/enum_loader.dart';
import 'package:rogue_adventure/components/floor_component.dart';
import 'package:rogue_adventure/models/entity/field.dart';
import 'package:rogue_adventure/enums/component/block_type.dart';

import '../components/blocks/blocks.dart';
import '../components/hud/hud_direction_button.dart';
import '../components/blocks/player.dart';
import '../systems/config.dart';
import '../enums/ui/hud_type.dart';
import 'package:flutter/services.dart' show rootBundle;

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {
  late Player player;
  late Sprite playerSprite;

  @override
  bool debugMode = false;
  //late double oneBlockSize = 64.0;

  @override
  void onGameResize(Vector2 canvasSize) {
    //oneBlockSize = canvasSize.x / 16;
    super.onGameResize(canvasSize);
  }

  Future<String> loadAsset() async {
    return rootBundle.loadString('json/sprite.json');
  }

  @override
  Future<void> onLoad() async {

    Map<SpriteCategoryType, Map<SpriteSubCategoryType, SpriteEntity>> assets = await SpriteTypeLoader.loadAssets();

    String jsonString = await loadAsset();
    var jsonData = jsonDecode(jsonString);


    super.onLoad();
    playerSprite = await Sprite.load('player1.png');

    await createFloor();

    await createPlayer();

    await createHud();

    camera.follow(player);
  }

  createFloor() async {


    Map<int, Sprite> spriteMap = await BlockType.getAllSpriteMap();
    List<List<int>> floorList = floor;
    FloorComponent floorComponent = FloorComponent(
        key: ComponentKey.named('floorComponent')
    );
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
        floorComponent.add(component);
      }
    }
    world.add(floorComponent);
  }

  Vector2 pos = Vector2(6, 4);
  createPlayer() {
    player = Player(
      size: Vector2.all(oneBlockSize),
      sprite: playerSprite,
      position: Vector2(pos.x * oneBlockSize,  pos.y *  oneBlockSize),
      anchor: Anchor.center,
      coordinate: pos,
        key: ComponentKey.named('Player')
    );
    world.add(player);
  }

  createHud() async {
    //camera.viewport.add(HudCreator.create(game: game, hudType: HudType.directionButton));
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
