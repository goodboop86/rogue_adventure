import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:rogue_adventure/components/hud/hud_creator.dart';
import 'package:rogue_adventure/systems/key_direction.dart';
import 'package:rogue_adventure/components/blocks/player.dart';

abstract class HudProduct extends Component  {

  load();
  create({required var game});


}
