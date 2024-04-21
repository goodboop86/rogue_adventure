import 'package:rogue_adventure/components/characters/character.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';

interface class BehaveStrategy {
  void behave(Character character, KeyInputType direction) {}
}

class MoveStrategy implements BehaveStrategy {
  @override
  void behave(Character character, KeyInputType direction) {
    character.moveTo(direction);
  }
}