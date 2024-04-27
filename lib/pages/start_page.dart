import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:logging/logging.dart';
import 'package:rogue_adventure/main_game_page.dart';
import 'package:rogue_adventure/pages/page.dart';
import 'package:rogue_adventure/systems/assets/image/loader.dart';
import 'package:rogue_adventure/systems/state_handler/character_storage.dart';

import '../components/blocks/blocks.dart';
import '../components/hud/hud_direction_button.dart';
import '../components/characters/player.dart';
import '../systems/config.dart';

import 'package:flame/events.dart';
import 'package:flutter/rendering.dart';


class StartPage extends Page with HasGameRef<GameRouter> {
  final Logger logging = Logger('MainGame');
  late Sprite playerSprite;
  late List<SpriteEntity> spriteEntities;
  CharacterStorage characters = CharacterStorage();

  SpriteEntity getSpriteEntityFromID({required int id}) {
    return spriteEntities.firstWhere((e) => e.id == id);
  }

  @override
  Future<void> onLoad() async {
    SpriteAssets assets = SpriteAssets();
    var entities = await assets.loadAssets();
    spriteEntities = entities;
    super.onLoad();

    await createUI();

  }

  createUI() async {
    double gameWidth = game.size.x;
    double gameHeight = game.size.y;
    int ratioOfGameSize = 16;
    double section = gameWidth / ratioOfGameSize;

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
    add(inventoryButton);
  }
  StartPage();
}

