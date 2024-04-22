import 'package:logging/logging.dart';
import 'package:rogue_adventure/components/characters/enemy.dart';
import 'package:rogue_adventure/components/characters/player.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';
import 'package:rogue_adventure/systems/strategy/character_move_operation_strategy.dart';


class CharacterOperatorHandler {
  final Logger _log = Logger('CharacterOperatorHandler');

  void operatePlayer(Player player, KeyInputType input){
    _log.info("Operating player: ${player.name}");

    switch (input.keyType) {
      case KeyType.move:
        execute(CharacterMoveOperationStrategy(character: player, input: input));
      case KeyType.action:
        playerAct(player, input);
      case KeyType.other:
        // do nothing
    }
  }

  void operateEnemy(Enemy enemy){

  }

  void execute(CharacterOperationStrategy strategy) {
    strategy.execute();
  }
  
  void playerAct(Player player, KeyInputType input) {
  }
  void playerMove(Player player, KeyInputType input) {
  }

  void enemyMove(Enemy enemy) {
  }
  void enemyAct(Enemy enemy) {
  }
}

main() {
}