import 'package:flame/components.dart';
import 'package:logging/logging.dart';
import 'package:rogue_adventure/components/characters/character.dart';
import 'package:rogue_adventure/pages/dungeon_page.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';

abstract class CharacterOperationStrategy {
  // ignore: unused_field
  final Logger logging = Logger('CharacterOperationStrategy');
  late Character character;
  late KeyInputType input;

  void execute() {}

  CharacterOperationStrategy({required this.character, required this.input});
}