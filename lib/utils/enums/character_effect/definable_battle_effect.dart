/*
* Effectを発動するためには下記を定義する必要がある
*
* - 何を(type)
* - いつ(when)
* - どの範囲に対して(where)
* - どの程度の確率で発火し(probability)
* - いつまで(duration)
*
* 何を(type)についてはbattle_effect.dartに定義する。
*/


// どの範囲に対して
enum BattleEffectWhere {
  me,
  adjacent,
  room,
  floor,
  attackArea,
  undefined;

  static BattleEffectWhere fromName(String name) {
    return BattleEffectWhere.values
        .firstWhere((element) => element.name == name);
  }
}

// いつ試す
enum BattleEffectWhen {
  beforeAttack,
  whenAttack,
  afterAttack,
  beforeBlock,
  whenBlock,
  afterBlock,
  consume,
  move,
  died,
  killed,
  floorChange,
  attackArea,
  undefined;

  static BattleEffectWhen fromName(String name) {
    return BattleEffectWhen.values
        .firstWhere((element) => element.name == name);
  }
}

// どの程度の確率で発火するか
enum BattleEffectProbability {
  never(0.0),
  almostNever(0.05),
  rarely(0.1),
  sometimes(0.2),
  half(0.5),
  usually(0.8),
  frequently(0.9),
  almostAlways(0.95),
  always(1.0),
  undefined(-1.0);

  final double prob;

  const BattleEffectProbability(
    this.prob,
  );

  static BattleEffectProbability fromName(String name) {
    return BattleEffectProbability.values
        .firstWhere((element) => element.name == name);
  }
}

// いつまで
enum BattleEffectDuration {
  fiveTurn,
  tenTurn,
  twentyTurn,
  fiftyTurn,
  hundredTurn,
  infiniteTurn,
  immediate,
  thisFloor,
  undefined;

  static BattleEffectDuration fromName(String name) {
    return BattleEffectDuration.values
        .firstWhere((element) => element.name == name);
  }
}

