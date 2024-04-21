enum WeedEffectType {
  powUp(WeedEffectCategory.empower),
  energyUp(WeedEffectCategory.empower),
  lifeUp(WeedEffectCategory.empower),
  perspective(WeedEffectCategory.special), // 透視
  float(WeedEffectCategory.special), // 浮遊
  expIncrease(WeedEffectCategory.special), // 経験値増加
  curseResist(WeedEffectCategory.statusResist), // 呪い耐性
  sleepResist(WeedEffectCategory.statusResist), // 眠り耐性
  poisonResist(WeedEffectCategory.statusResist); // 毒耐性

  final WeedEffectCategory type;
  const WeedEffectType(this.type);

}

enum WeedEffectCategory {
  empower, // 強化
  special, // 特殊
  statusResist, // 耐性
}