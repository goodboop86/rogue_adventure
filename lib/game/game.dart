import 'dart:convert';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:rogue_adventure/assets/image/category/character_type.dart';
import 'package:rogue_adventure/assets/image/category/consumable_type.dart';
import 'package:rogue_adventure/assets/image/category/equipment_type.dart';
import 'package:rogue_adventure/assets/image/category/ui_type.dart';
import 'package:rogue_adventure/assets/image/common_type.dart';
import 'package:rogue_adventure/assets/image/loader.dart';
import 'package:rogue_adventure/components/characters/character.dart';
import 'package:rogue_adventure/components/characters/enemy.dart';
import 'package:rogue_adventure/components/floor_component.dart';
import 'package:rogue_adventure/enums/ui/key_direction.dart';
import 'package:rogue_adventure/models/entity/field.dart';
import 'package:rogue_adventure/enums/component/block_type.dart';

import '../components/blocks/blocks.dart';
import '../components/hud/hud_direction_button.dart';
import '../components/characters/player.dart';
import '../systems/config.dart';
import '../enums/ui/hud_type.dart';
import 'package:flutter/services.dart' show rootBundle;

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {
  late Player player;
  late Enemy enemy;
  late Sprite playerSprite;
  late List<SpriteEntity> spriteEntities;
  List<HudButtonComponent> buttons = [];

  @override
  bool debugMode = false;


  @override
  void onGameResize(Vector2 canvasSize) {
    //oneBlockSize = canvasSize.x / 16;
    super.onGameResize(canvasSize);
  }

  SpriteEntity getSpriteEntityFromID({required int id}) {
    return spriteEntities.firstWhere((e) => e.id == id);
  }

  @override
  Future<void> onLoad() async {
    SpriteAssets assets = SpriteAssets();
    var entities = await assets.loadAssets();

    spriteEntities = entities;

    super.onLoad();

    await createBlock();

    await createCharacter();

    await createUI();

    camera.follow(player);
  }

  createBlock() async {
    List<List<int>> floorList = floor;
    FloorComponent floorComponent =
        FloorComponent(key: ComponentKey.named('floorComponent'));
    for (int i = 0; i < floorList.length; i++) {
      for (int j = 0; j < floorList[i].length; j++) {
        int id = floorList[i][j];
        final component =
            Blocks.initialize(entity: getSpriteEntityFromID(id: id))
              ..position = Vector2(j * oneBlockSize, i * oneBlockSize)
              ..anchor = Anchor.center
              ..coordinate = Vector2(j.toDouble(), i.toDouble());

        floorComponent.add(component);
      }
    }
    world.add(floorComponent);
  }



  createCharacter() {
    Vector2 playerPos = Vector2(6, 4);
    player =
        Character.initialize(entity: getSpriteEntityFromID(id: 200)) as Player;
    player
      ..position = Vector2(playerPos.x * oneBlockSize, playerPos.y * oneBlockSize)
      ..anchor = Anchor.center
      ..coordinate = playerPos;

    Vector2 enemyPos = Vector2(8, 4);
    enemy =
    Character.initialize(entity: getSpriteEntityFromID(id: 251)) as Enemy;
    enemy
      ..position = Vector2(enemyPos.x * oneBlockSize, enemyPos.y * oneBlockSize)
      ..anchor = Anchor.center
      ..coordinate = enemyPos;

    world.addAll([player, enemy]);
  }

  createUI() async {
    buttons = await HudDirectionButton().getHudDirectionButtons(player);
    camera.viewport.addAll(buttons);
  }

  @override
  void onMount() {
    for (var direction in KeyDirection.values) {
      int id = direction.index;
      HudButtonComponent button = buttons[id];
      button
        .onPressed = () {
          player.moveTo(direction);
        };
    }
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
