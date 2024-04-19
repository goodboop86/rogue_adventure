enum ScrollEffectType {
  confuseRE(ScrollEffectCategory.roomEffect),
  sleepRE(ScrollEffectCategory.roomEffect),
  damageRE(ScrollEffectCategory.roomEffect),
  damageNE(ScrollEffectCategory.neighborEffect),
  enhanceWeaponIIE(ScrollEffectCategory.inventoryItemEffect),
  identifyIIE(ScrollEffectCategory.inventoryItemEffect), // 識別
  eagleEyeFE(ScrollEffectCategory.inventoryItemEffect);

  final ScrollEffectCategory type;
  const ScrollEffectType(this.type);

}

enum ScrollEffectCategory {
  roomEffect,
  neighborEffect,
  floorEffect,
  inventoryItemEffect,
}