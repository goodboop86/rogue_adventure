// アイテムの希少度
import 'package:rogue_adventure/assets/image/category/block_type.dart';
import 'package:rogue_adventure/assets/image/category/character_type.dart';
import 'package:rogue_adventure/assets/image/category/consumable_type.dart';
import 'package:rogue_adventure/assets/image/category/equipment_type.dart';
import 'package:rogue_adventure/assets/image/category/ui_type.dart';


enum RarityType { common, uncommon, rare, epic, legendary, mythic }

// アイテムの使いやすさ、癖のなさ
enum HowEaseType {
  easy,
  moderate,
  hard,
}

// アイテムのテーマ(時期なのか、種類なのか)
enum ThemeType {
  basic,
  second, //適当
  third,
}

// imageの種類
enum SpriteCategoryType {
  block(BlockType),
  character(CharacterType),
  consumable(ConsumableType),
  equipment(EquipmentType),
  ui(UIType);

  final myType;

  const SpriteCategoryType(this.myType);
}

// サブカテゴリ
enum SpriteSubCategoryType {
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
