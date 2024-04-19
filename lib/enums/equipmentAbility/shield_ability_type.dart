enum ShieldAbilityType {
  dragonAttackResist(ShieldAbilityCategory.anomalousAttackResist),
  burstAttackResist(ShieldAbilityCategory.anomalousAttackResist),
  poisonAttackResist(ShieldAbilityCategory.anomalousAttackResist),
  counterAttack(ShieldAbilityCategory.special),
  evasion(ShieldAbilityCategory.special), // 回避
  magicReflection(ShieldAbilityCategory.special),// 透視
  missShot(ShieldAbilityCategory.special),
  expIncrease(ShieldAbilityCategory.special); // 経験値増加

  final ShieldAbilityCategory type;
  const ShieldAbilityType(this.type);

}

enum ShieldAbilityCategory {
  anomalousAttackResist, // 特殊攻撃耐性
  special, // 特殊
}