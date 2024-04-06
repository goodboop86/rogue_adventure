import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:rogue_adventure/systems/key_direction.dart';
import 'package:rogue_adventure/components/blocks/player.dart';

class HudDirectionButtons {
  final List<HudButtonComponent> _hudButtonComponentList = [];

  double size = 8.0;
  double ratio = 8.0;
  late Vector2 screenSize;

  Future<List<HudButtonComponent>> getHudDirectionButtons(Player player) async {
    Image buttons = await Flame.images.load('hud_direction_button.png');
    Image downButtons =
        await Flame.images.load('hud_direction_down_button.png');

    final hudDirectionButtonsSpriteSheet =
        SpriteSheet(image: buttons, srcSize: Vector2.all(size));
    final hudDirectionDownButtonsSpriteSheet =
        SpriteSheet(image: downButtons, srcSize: Vector2.all(size));

    for (var direction in KeyDirection.values) {
      _hudButtonComponentList.add(
        HudButtonComponent(
          button: SpriteComponent(
            size: Vector2.all(size * ratio),
            sprite:
                hudDirectionButtonsSpriteSheet.getSpriteById(direction.index),
          ),
          buttonDown: SpriteComponent(
            size: Vector2.all(size * ratio),
            sprite: hudDirectionDownButtonsSpriteSheet
                .getSpriteById(direction.index),
          ),
          position: (screenSize * 0.01) +
              Vector2(direction.x * size * ratio, direction.y * size * ratio),
          onPressed: () {
            player.moveTo(direction);
          },
        ),
      );
    }

    return _hudButtonComponentList;
  }

  HudDirectionButtons({required this.screenSize});
}
