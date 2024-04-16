// バトルで影響を及ぼす効果の種類
enum BattleEffectType {
  /* ターンを跨いで影響する状態変化(negative condition) */
  stun(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), // スタン
  freeze(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), // 凍結
  burn(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), // 火傷
  poison(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), // 猛毒
  bleed(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), //出血
  curse(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), // 呪い
  charm(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), //魅了
  sleep(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), // 睡眠
  silence(BattleEffectCategory.negEffect,
      BattleEffectTargetRange.playerAndEnemy, false), // 沈黙
  blind(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), // 盲目
  fear(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), // 恐怖
  taunt(BattleEffectCategory.negEffect, BattleEffectTargetRange.playerAndEnemy,
      false), //挑発

  /* ターンを跨いで影響する状態変化(positive condition) */
  invincible(BattleEffectCategory.posEffect, BattleEffectTargetRange.onlyPlayer,
      false), //無敵

  /* 即時反映効果 */
  lifeRecovery(BattleEffectCategory.heal, BattleEffectTargetRange.onlyPlayer,
      false), // ライフ回復
  energyRecovery(BattleEffectCategory.heal, BattleEffectTargetRange.onlyPlayer,
      false), // エネルギー回復

  /* ターンを跨いで影響する能力変化(positive condition) */
  attackPowUp(BattleEffectCategory.posEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // 攻撃力アップ
  defensePowUp(BattleEffectCategory.posEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // 防御力アップ
  speedUp(BattleEffectCategory.posEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // スピードアップ
  criticalUp(BattleEffectCategory.posEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // クリティカルアップ
  hitRateUp(BattleEffectCategory.posEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // 命中率アップ
  resistanceUp(BattleEffectCategory.posEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // 耐性アップ

  /* ターンを跨いで影響する能力変化(negative condition) */
  attackPowDown(BattleEffectCategory.negEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // 攻撃力ダウン
  defensePowDown(BattleEffectCategory.negEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // 防御力ダウン
  speedDown(BattleEffectCategory.negEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // スピードダウン
  hitRateDown(BattleEffectCategory.negEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // 命中率ダウン

  /* 攻撃時に発動する効果 */
  lifeSteal(BattleEffectCategory.posEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // ライフスティール
  energySteal(BattleEffectCategory.posEffect,
      BattleEffectTargetRange.playerAndEnemy, true), // エネルギースティール

  /* 攻撃を受けたときに発動する効果 */
  reflect(BattleEffectCategory.posEffect,
      BattleEffectTargetRange.playerAndEnemy, false), //反射
  counter(BattleEffectCategory.posEffect, BattleEffectTargetRange.onlyPlayer,
      false), //反撃
  evasionRateUp(BattleEffectCategory.posEffect,
      BattleEffectTargetRange.playerAndEnemy, true), //回避

  undefined(
      BattleEffectCategory.undefined, BattleEffectTargetRange.undefined, true);

  final BattleEffectCategory category;
  final BattleEffectTargetRange targetRange;
  final bool allowOverlap;

  const BattleEffectType(this.category, this.targetRange, this.allowOverlap);

  static BattleEffectType fromName(String name) {
    return BattleEffectType.values
        .firstWhere((element) => element.name == name);
  }
}

// 効果のカテゴリ
enum BattleEffectCategory {
  posEffect,
  negEffect,
  buff,
  deBuff,
  damage,
  heal,
  undefined;

  static BattleEffectCategory fromName(String name) {
    return BattleEffectCategory.values
        .firstWhere((element) => element.name == name);
  }
}

// 効果を受ける可能性のあるキャラクターの範囲
enum BattleEffectTargetRange {
  playerAndEnemy,
  onlyPlayer,
  onlyEnemy,
  undefined;

  static BattleEffectTargetRange fromName(String name) {
    return BattleEffectTargetRange.values
        .firstWhere((element) => element.name == name);
  }
}
