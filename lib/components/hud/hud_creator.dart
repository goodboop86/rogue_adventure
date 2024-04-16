import 'package:flame/components.dart';
import 'package:rogue_adventure/components/hud/hud_direction_button.dart';
import 'package:rogue_adventure/game/game.dart';

import '../../utils/enums/ui/hud_type.dart';

abstract class HudCreator extends Component with HasGameRef<MainGame> {

  loadImage();
  create();

  HudCreator();
  HudCreator.create({required HasGameRef<MainGame> game, required HudType hudType}) {
    switch(hudType) {
      case HudType.directionButton:
        //HudDirectionButton.load().then((value) => null)
        //return HudDirectionButton.create(game: game);
      case HudType.healthGauge:
      default:
        throw Exception();

    }
  }
}