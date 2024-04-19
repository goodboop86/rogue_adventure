// アイテムの希少度
enum RarityEnum { common, uncommon, rare, epic, legendary, mythic }

// アイテムの使いやすさ、癖のなさ
enum HowEaseEnum {
  easy,
  moderate,
  hard,
}

// アイテムのテーマ(時期なのか、種類なのか)
enum ThemeEnum {
  basic,
  second, //適当
  third,
}

// imageの種類
enum ImageTypeEnum {
  floorBlock,
  wallBlock,
  enemyCharacter,
  playerCharacter,
  npcCharacter,
  foodConsumable,
  scrollConsumable,
  weedConsumable,
  accessoryEquipment,
  shieldEquipment,
  weaponEquipment,
  buttonUI,
  effectUI,
  iconUI;
}