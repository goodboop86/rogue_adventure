
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:logging/logging.dart';
import 'package:rogue_adventure/assets/image/loader.dart';
import 'package:rogue_adventure/components/blocks/wall.dart';
import 'package:rogue_adventure/components/characters/character.dart';
import 'package:rogue_adventure/components/characters/enemy.dart';
import 'package:rogue_adventure/components/floor_component.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';
import 'package:rogue_adventure/models/entity/field.dart';
import 'package:rogue_adventure/systems/state_handler/character_storage.dart';
import 'package:rogue_adventure/systems/turn_processer.dart';

import '../components/blocks/blocks.dart';
import '../components/hud/hud_direction_button.dart';
import '../components/characters/player.dart';
import '../systems/config.dart';

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {
  final Logger logging = Logger('MainGame');
  late Player player;
  late Enemy enemy;
  late Enemy enemy2;
  late Sprite playerSprite;
  late List<SpriteEntity> spriteEntities;
  List<HudButtonComponent> buttons = [];
  CharacterStorage characters = CharacterStorage();

  @override
  bool debugMode = true;


  @override
  void onGameResize(Vector2 size) {
    //oneBlockSize = canvasSize.x / 16;
    super.onGameResize(size);
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

    Vector2 enemyPos = Vector2(8, 6);
    enemy =
    Character.initialize(entity: getSpriteEntityFromID(id: 251)) as Enemy;
    enemy
      ..position = Vector2(enemyPos.x * oneBlockSize, enemyPos.y * oneBlockSize)
      ..anchor = Anchor.center
      ..coordinate = enemyPos;

    enemy2 =
    Character.initialize(entity: getSpriteEntityFromID(id: 251)) as Enemy;
    enemy2
      ..position = Vector2(enemyPos.x * oneBlockSize, enemyPos.y * oneBlockSize)
      ..anchor = Anchor.center
      ..coordinate = enemyPos;

    world.addAll([player, enemy, enemy2]);
    characters.registerAll([player, enemy, enemy2]);
  }

  createUI() async {
    buttons = await HudDirectionButton().getHudDirectionButtons(player);
    camera.viewport.addAll(buttons);
  }

  @override
  void onMount() {

    TurnProcessor turnProcessor = TurnProcessor(characters: characters);
    for (var direction in KeyInputType.directionKeys) {
      int id = direction.index;
      HudButtonComponent button = buttons[id];
      button
        .onPressed = () {
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

  MainGame({required super.camera});
}
