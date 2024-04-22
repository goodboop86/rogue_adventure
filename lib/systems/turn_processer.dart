import 'package:rogue_adventure/systems/character_act_type.dart';
import 'package:rogue_adventure/systems/key_input_type.dart';
import 'package:rogue_adventure/systems/state_handler/character_storage.dart';
import 'package:rogue_adventure/systems/state_handler/turn_state_handler.dart';

class TurnProcessor {
  late TurnStateHandler handler;
  void process(KeyInputType input){
    handler.currentKeyInput = input;
    handler.updateTurnState(TurnStateType.playerTurn);
    //handler.updateTurnState(TurnStateType.enemyTurn);
    //handler.updateTurnState(TurnStateType.turnEnd);
  }
  TurnProcessor({required CharacterStorage characters}){
    handler = TurnStateHandler(characters: characters);
  }
}