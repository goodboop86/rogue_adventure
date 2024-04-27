import 'package:logging/logging.dart';
import 'package:rogue_adventure/systems/character_act_type.dart';
import 'package:rogue_adventure/systems/state_handler/character_behavior_handler.dart';
import 'package:rogue_adventure/systems/state_handler/character_storage.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';

class TurnStateHandler {
  final Logger logging = Logger('TurnStateHandler');
  final CharacterOperatorHandler _operatorHandler = CharacterOperatorHandler();
  late CharacterStorage characters;
  TurnStateType _currentTurnState = TurnStateType.keyInput;
  KeyInputType _currentKeyInput = KeyInputType.none;

  set currentKeyInput(KeyInputType input) {
    logging.info("Setting current key input: ${input.name}");
    _currentKeyInput = input;

  }

  void updateTurnState(TurnStateType state) {
    logging.info("Updating turn state: ${state.name}");
    _currentTurnState = state;

    switch (_currentTurnState) {
      case TurnStateType.playerTurn:
        startPlayerTurn();
      case TurnStateType.enemyTurn:
        startEnemyTurn();
      case TurnStateType.turnEnd:
        turnEnd();
      case TurnStateType.keyInput:
    }
  }

  void startPlayerTurn() {
    logging.info("Starting player turn");
    // NOTE: Playerは一人だけなので厳密にはループは不要
    for (var player in characters.players) {
      _operatorHandler.operatePlayer(player, _currentKeyInput);
    }
  }

  void startEnemyTurn() {
    for (var enemy in characters.enemies) {
      // TODO: 敵の行動ロジックを決める必要がある。移動or攻撃or...
      _operatorHandler.operateEnemy(enemy);
    }
  }

  void turnEnd() {
    _currentKeyInput = KeyInputType.none;
    updateTurnState(TurnStateType.keyInput);
  }

  TurnStateHandler({required this.characters});
}
