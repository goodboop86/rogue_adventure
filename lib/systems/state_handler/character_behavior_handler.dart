import 'package:rogue_adventure/components/characters/enemy.dart';
import 'package:rogue_adventure/components/characters/player.dart';
import 'package:rogue_adventure/systems/behave_strategy.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';


class CharacterOperatorHandler {

  void operatePlayer(Player player, KeyInputType input){
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