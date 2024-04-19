enum WeaponAbilityType {
  dragonKiller(WeaponAbilityCategory.killer),
  GrimReaperKiller(WeaponAbilityCategory.killer),
  lifeSteal(WeaponAbilityCategory.special),
  energySteal(WeaponAbilityCategory.special),
  threeProngedAttack(WeaponAbilityCategory.special),// 透視
  missShot(WeaponAbilityCategory.special),
  expIncrease(WeaponAbilityCategory.special); // 経験値増加

  final WeaponAbilityCategory type;
  const WeaponAbilityType(this.type);

}

enum WeaponAbilityCategory {
  killer, // キラー
  special, // 特殊
}