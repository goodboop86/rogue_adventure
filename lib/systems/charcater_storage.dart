import 'package:rogue_adventure/components/characters/character.dart';
import 'package:rogue_adventure/components/characters/enemy.dart';
import 'package:rogue_adventure/components/characters/npc.dart';
import 'package:rogue_adventure/components/characters/player.dart';

class CharacterStorage {
  List<Enemy> enemies = [];
  List<Player> players = [];
  List<NPC> npcs = [];

  void register(Character character) {
    if (character is Enemy) {
      enemies.add(character);
    } else if (character is Player) {
      players.add(character);
    } else if (character is NPC) {
      npcs.add(character);
    }
  }

  void registerAll(List<Character> characters) {
    for (var character in characters) {
      register(character);
    }
  }

  void remove(Character character) {
    if (character is Enemy) {
      enemies.remove(character);
    } else if (character is Player) {
      players.remove(character);
    } else if (character is NPC) {
      npcs.remove(character);
    }
  }

}