enum AccessoryAbilityType {
  powUp(AccessoryAbilityCategory.empower),
  energyUp(AccessoryAbilityCategory.empower),
  lifeUp(AccessoryAbilityCategory.empower),
  perspective(AccessoryAbilityCategory.special), // 透視
  float(AccessoryAbilityCategory.special), // 浮遊
  expIncrease(AccessoryAbilityCategory.special), // 経験値増加
  curseResist(AccessoryAbilityCategory.statusResist), // 呪い耐性
  sleepResist(AccessoryAbilityCategory.statusResist), // 眠り耐性
  poisonResist(AccessoryAbilityCategory.statusResist); // 毒耐性

  final AccessoryAbilityCategory type;
  const AccessoryAbilityType(this.type);

}

enum AccessoryAbilityCategory {
  empower, // 強化
  special, // 特殊
  statusResist, // 耐性
}