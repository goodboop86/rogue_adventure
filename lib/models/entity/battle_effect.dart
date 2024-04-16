import 'package:rogue_adventure/utils/enums/character_effect/battle_effect.dart';
import 'package:rogue_adventure/utils/enums/character_effect/definable_battle_effect.dart';

class BattleEffect {
  late final BattleEffectType type;
  late final BattleEffectWhen when;
  late final BattleEffectWhere where;
  late final BattleEffectProbability probability;
  late final BattleEffectDuration duration;

  BattleEffect({
    required Map<String, String> battleEffect,
  }) {
    type = BattleEffectType.fromName(battleEffect['type']!);
    when = BattleEffectWhen.fromName(battleEffect['when']!);
    where = BattleEffectWhere.fromName(battleEffect['where']!);
    probability = BattleEffectProbability.fromName(battleEffect['probability']!);
    duration = BattleEffectDuration.fromName(battleEffect['duration']!);
  }
}