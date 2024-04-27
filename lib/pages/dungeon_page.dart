import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:logging/logging.dart';
import 'package:rogue_adventure/main_game_page.dart';
import 'package:rogue_adventure/pages/page.dart';
import 'package:rogue_adventure/systems/assets/image/loader.dart';
import 'package:rogue_adventure/components/characters/character.dart';
import 'package:rogue_adventure/components/characters/enemy.dart';
import 'package:rogue_adventure/components/characters/npc.dart';
import 'package:rogue_adventure/components/floor_component.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';
import 'package:rogue_adventure/models/entity/field.dart';
import 'package:rogue_adventure/systems/state_handler/character_storage.dart';
import 'package:rogue_adventure/systems/turn_processer.dart';

import '../components/blocks/blocks.dart';
import '../components/hud/hud_direction_button.dart';
import '../components/characters/player.dart';
import '../systems/config.dart';

import 'package:flutter/rendering.dart';


class DungeonPage extends Page with HasGameRef<GameRouter> {
  final Logger logging = Logger('MainGame');
  late Player player;
  late Enemy enemy;
  late NPC npc;
  late Sprite playerSprite;
  late List<SpriteEntity> spriteEntities;
  List<HudButtonComponent> buttons = [];
  CharacterStorage characters = CharacterStorage();

  @override
  //bool debugMode = true;

  @override
  void onGameResize(Vector2 size) {
    //oneBlockSize = canvasSize.x / 16;
    super.onGameResize(size);
  }

  SpriteEntity getSpriteEntityFromID({required int id}) {
    return spriteEntities.firstWhere((e) => e.id == id);
  }

  // SpriteEntity getSpriteEntityFromName({required String name}) {
  //   return spriteEntities.firstWhere((e) => e.name == name);
  // }

  @override
  Future<void> onLoad() async {
    SpriteAssets assets = SpriteAssets();
    var entities = await assets.loadAssets();

    spriteEntities = entities;

    super.onLoad();

    await createBlock();

    await createCharacter();

    await createUI();

    game.camera.follow(player);
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
    game.world.add(floorComponent);
  }

  createCharacter() {
    Vector2 playerPos = Vector2(6, 4);
    player =
        Character.initialize(entity: getSpriteEntityFromID(id: 200)) as Player;
    player
      ..position =
          Vector2(playerPos.x * oneBlockSize, playerPos.y * oneBlockSize)
      ..anchor = Anchor.center
      ..coordinate = playerPos;

    Vector2 enemyPos = Vector2(8, 6);
    enemy =
        Character.initialize(entity: getSpriteEntityFromID(id: 251)) as Enemy;
    enemy
      ..position = Vector2(enemyPos.x * oneBlockSize, enemyPos.y * oneBlockSize)
      ..anchor = Anchor.center
      ..coordinate = enemyPos;

    Vector2 npcPos = Vector2(4, 4);
    npc =
        Character.initialize(entity: getSpriteEntityFromID(id: 300)) as NPC;
    npc
      ..position = Vector2(npcPos.x * oneBlockSize, npcPos.y * oneBlockSize)
      ..anchor = Anchor.center
      ..coordinate = npcPos;

    game.world.addAll([player, enemy, npc]);
    characters.registerAll([player, enemy, npc]);
  }

  createUI() async {
    double gameWidth = game.size.x;
    double gameHeight = game.size.y;
    int ratioOfGameSize = 16;
    double section = gameWidth / ratioOfGameSize;

    // directional buttons
    List<List<int>> positions = [
      [0, 2],
      [1, 2],
      [2, 2],
      [0, 1],
      [1, 1],
      [2, 1],
      [0, 0],
      [1, 0],
      [2, 0]
    ];
    buttons = await HudDirectionButton().getHudDirectionButtons(player);
    for (var button in buttons) {
      int id = buttons.indexOf(button);
      int posX = positions[id][0];
      int posY = positions[id][1];
      button
        ..button?.size = Vector2.all(section)
        ..buttonDown?.size = Vector2.all(section)
        ..position = Vector2(posX * section + 2 * section,
            gameHeight - (posY * section + section))
        ..anchor = Anchor.center;
      logging.info("button size: ${button.size}");
    }

    Sprite inventoryButtonSprite = getSpriteEntityFromID(id: 800).sprite;
    SpriteButtonComponent inventoryButton = SpriteButtonComponent(
      button: inventoryButtonSprite,
      buttonDown: inventoryButtonSprite,
    )
      ..position = Vector2(game.size.x - section * 2, game.size.y - section * 2)
      ..size = Vector2.all(section)
      ..onPressed = () {

        // overlays.isActive('Inventory') ?
    };

      // create player status
    SpriteComponent heart = getSpriteEntityFromID(id: 900).getSpriteComponent();
    heart
      ..position = Vector2(section, section / 2)
      ..size = Vector2.all(section / 2)
      ..anchor = Anchor.center;

    TextComponent heartText = TextComponent();
    heartText
      ..position = Vector2(section * 1.5, section / 2)
      ..size = Vector2.all(section / 2)
      ..anchor = Anchor.center
      ..text = 10.toString()
      ..textRenderer = TextPaint(
        style: TextStyle(
          fontSize: 20.0,
          color: BasicPalette.white.color,
        ),
      );

    SpriteComponent sword = getSpriteEntityFromID(id: 900).getSpriteComponent();
    sword
      ..position = Vector2(section * 2, section / 2)
      ..size = Vector2.all(section / 2)
      ..anchor = Anchor.center;

    TextComponent swordText = TextComponent();
    swordText
      ..position = Vector2(section * 2.5, section / 2)
      ..size = Vector2.all(section / 2)
      ..anchor = Anchor.center
      ..text = player.gameParam['life'].toString()
      ..textRenderer = TextPaint(
        style: TextStyle(
          fontSize: 20.0,
          color: BasicPalette.white.color,
        ),
      );


    game.camera.viewport.addAll([heart, heartText, sword, swordText, inventoryButton]);
    game.camera.viewport.addAll(buttons);
  }

  @override
  void onMount() {
    TurnProcessor turnProcessor = TurnProcessor(characters: characters);
    for (var direction in KeyInputType.directionKeys) {
      int id = direction.index;
      HudButtonComponent button = buttons[id];
      button.onPressed = () {
        //player.moveTo(direction);
        turnProcessor.process(direction);
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

  DungeonPage();
}