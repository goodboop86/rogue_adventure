import 'package:rogue_adventure/components/characters/character.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';


class NPC extends Character {

  var leftSide = KeyInputType.leftDirectionKeys;
  var rightSide = KeyInputType.rightDirectionKeys;
  var otherSide = KeyInputType.otherDirectionKeys;


  NPC({
    required super.name,
    required super.sprite,
    required super.size,
    required super.key,
    required super.gameParam,
  });
}
