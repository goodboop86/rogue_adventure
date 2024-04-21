import 'package:rogue_adventure/components/characters/player.dart';
import 'package:rogue_adventure/systems/character_act_type.dart';
import 'package:rogue_adventure/systems/charcater_storage.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';

class TurnProcessHandler {
  final CharacterBehaviorHandler _characterHandler = CharacterBehaviorHandler();
  late CharacterStorage characters;
  TurnStateType _currentTurnState = TurnStateType.keyInput;
  KeyInputType _currentKeyInput = KeyInputType.none;

  void _updateTurnState(TurnStateType state) {
    _currentTurnState = state;

    switch (_currentTurnState) {
      case TurnStateType.playerTurn:
        startPlayerTurn();
      case TurnStateType.enemyTurn:
        _characterHandler.enemyMove();
        _characterHandler.enemyAct();
      case TurnStateType.keyInput:
        _currentKeyInput = KeyInputType.none;
      case TurnStateType.turnEnd:
        // TODO: Handle this case.
    }
  }
  set currentKeyInput(KeyInputType input) => _currentKeyInput = input;

  void start(KeyInputType input) {
    currentKeyInput = input;
    _updateTurnState(TurnStateType.playerTurn);

  }
  
  void startPlayerTurn(){
    switch (_currentKeyInput.type) {
      case KeyType.move:
        _characterHandler.playerMove(characters.players, _currentKeyInput);
      case KeyType.action:
        _characterHandler.playerAct(characters.players, _currentKeyInput);
      case KeyType.other:
        _currentTurnState = TurnStateType.keyInput;
    }
    _updateTurnState(TurnStateType.enemyTurn);
  }

  void startEnemyTurn(){
    // TODO: 敵の行動ロジックを決める必要がある。移動or攻撃or...
    switch (_currentKeyInput.type) {
      case KeyType.move:
        _characterHandler.playerMove(characters.players, _currentKeyInput);
      case KeyType.action:
        _characterHandler.playerAct(characters.players, _currentKeyInput);
      case KeyType.other:
        _currentTurnState = TurnStateType.keyInput;
    }
    _updateTurnState(TurnStateType.enemyTurn);
  }

  

  TurnProcessHandler({required this.characters});
}

class CharacterBehaviorHandler {
  
  void playerAct(List<Player> players, KeyInputType input) {
  }
  void playerMove(List<Player> players, KeyInputType input) {
  }

  void enemyMove() {
  }
  void enemyAct() {
  }
  
  
}