import 'package:rogue_adventure/assets/image/common_type.dart';

enum CharacterType {
  player0(200, SpriteSubCategoryType.playerCharacter,
      "character/player/player1.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.playerCharacter,
  }, {
    "sprite_size": [32.0, 32.0],
  }),
  player1(201, SpriteSubCategoryType.playerCharacter,
      "character/player/player2.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.playerCharacter,
  }, {
    "sprite_size": [32.0, 32.0],
  }),
  player2(202, SpriteSubCategoryType.playerCharacter,
      "character/player/player3.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.playerCharacter,
  }, {
    "sprite_size": [32.0, 32.0],
  }),
  enemy0(
  250, SpriteSubCategoryType.enemyCharacter, "character/enemy/enemy1.png", {
  "life": 10,
  "energy": 10,
  "atk": 10,
  "def": 10,
  "type": SpriteSubCategoryType.enemyCharacter,
  }, {
  "sprite_size": [32.0, 32.0],
  }),
  enemy1(
  251, SpriteSubCategoryType.enemyCharacter, "character/enemy/enemy2.png", {
  "life": 10,
  "energy": 10,
  "atk": 10,
  "def": 10,
  "type": SpriteSubCategoryType.enemyCharacter,
  }, {
  "sprite_size": [32.0, 32.0],
  }),
  enemy2(
  252, SpriteSubCategoryType.enemyCharacter, "character/enemy/enemy3.png", {
  "life": 10,
  "energy": 10,
  "atk": 10,
  "def": 10,
  "type": SpriteSubCategoryType.enemyCharacter,
  }, {
  "sprite_size": [32.0, 32.0],
  }),
  npc0(300, SpriteSubCategoryType.npcCharacter, "character/npc/npc1.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.npcCharacter,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [32.0, 32.0],
  }),
  npc1(301, SpriteSubCategoryType.npcCharacter, "character/npc/npc2.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.npcCharacter,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [32.0, 32.0],
  }),
  npc2(302, SpriteSubCategoryType.npcCharacter, "character/npc/npc3.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.npcCharacter,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "sprite_size": [32.0, 32.0],
  });

  final int id;
  final SpriteSubCategoryType spriteSubCategory;
  final String spritePath;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;
  final SpriteCategoryType myType = SpriteCategoryType.character;

  const CharacterType(
    this.id,
    this.spriteSubCategory,
    this.spritePath,
    this.gameParam,
    this.assetParam,
  );
}