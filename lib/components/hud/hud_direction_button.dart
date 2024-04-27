
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';
import 'package:rogue_adventure/components/characters/player.dart';

class HudDirectionButton  {
  final List<HudButtonComponent> _hudButtonComponentList = [];

  double imgSize = 8.0;
  double ratio = 8.0;
  late Image buttons;
  late Image downButtons;
  late List<HudButtonComponent> hudButtonComponents = [];



  // @override
  // create({required HasGameRef<GameRouter> game}){
  //   final hudDirectionButtonsSpriteSheet =
  //   SpriteSheet(image: buttons, srcSize: Vector2.all(imgSize));
  //   final hudDirectionDownButtonsSpriteSheet =
  //   SpriteSheet(image: downButtons, srcSize: Vector2.all(imgSize));
  //
  //   for (var direction in KeyDirection.values) {
  //     children.add(
  //       HudButtonComponent(
  //         button: SpriteComponent(
  //           size: Vector2.all(game.),
  //           sprite:
  //           hudDirectionButtonsSpriteSheet.getSpriteById(direction.index),
  //         ),
  //         buttonDown: SpriteComponent(
  //           size: Vector2.all(imgSize * ratio),
  //           sprite: hudDirectionDownButtonsSpriteSheet
  //               .getSpriteById(direction.index),
  //         ),
  //         position:
  //         Vector2(
  //             direction.x * imgSize * ratio, direction.y * imgSize * ratio),
  //         onPressed: () {
  //           player.moveTo(direction);
  //         },
  //       ),
  //     );
  //   }
  //
  // }






  Future<List<HudButtonComponent>> getHudDirectionButtons(Player player) async {
    Image buttons = await Flame.images.load('ui/button/hud_direction_button.png');
    Image downButtons =
    await Flame.images.load('ui/button/hud_direction_down_button.png');

    final hudDirectionButtonsSpriteSheet =
    SpriteSheet(image: buttons, srcSize: Vector2.all(imgSize));
    final hudDirectionDownButtonsSpriteSheet =
    SpriteSheet(image: downButtons, srcSize: Vector2.all(imgSize));

    List<KeyInputType> directions = KeyInputType.directionKeys;
    for (var direction in directions) {
      _hudButtonComponentList.add(
        HudButtonComponent(
          button: SpriteComponent(
            size: Vector2.all(imgSize * ratio),
            sprite:
            hudDirectionButtonsSpriteSheet.getSpriteById(direction.index),
          ),
          buttonDown: SpriteComponent(
            size: Vector2.all(imgSize * ratio),
            sprite: hudDirectionDownButtonsSpriteSheet
                .getSpriteById(direction.index),
          ),
        ),
      );
    }

    return _hudButtonComponentList;
  }




  HudDirectionButton() {
    // children.addAll(
    //     List.generate(KeyDirection.values.length, (_) => HudButtonComponent()));
  }

}
