import 'package:rogue_adventure/assets/image/common_type.dart';

enum CharacterType {
  player1(0, SpriteSubCategoryType.playerCharacter,
      "images/character/player/player1.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.playerCharacter,
  }, {
    "path": "images/character/player/player1.png",
    "sprite_size": [32, 32],
  }),
  player2(1, SpriteSubCategoryType.playerCharacter,
      "images/character/player/player2.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.playerCharacter,
  }, {
    "path": "images/character/player/player2.png",
    "sprite_size": [32, 32],
  }),
  player3(2, SpriteSubCategoryType.playerCharacter,
      "images/character/player/player3.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.playerCharacter,
  }, {
    "path": "images/character/player/player3.png",
    "sprite_size": [32, 32],
  }),
  enemy1(
  0, SpriteSubCategoryType.enemyCharacter, "images/character/enemy/enemy1.png", {
  "life": 10,
  "energy": 10,
  "atk": 10,
  "def": 10,
  "type": SpriteSubCategoryType.enemyCharacter,
  }, {
  "path": "images/character/enemy/enemy1.png",
  "sprite_size": [32, 32],
  }),
  enemy2(
  1, SpriteSubCategoryType.enemyCharacter, "images/character/enemy/enemy2.png", {
  "life": 10,
  "energy": 10,
  "atk": 10,
  "def": 10,
  "type": SpriteSubCategoryType.enemyCharacter,
  }, {
  "path": "images/character/enemy/enemy2.png",
  "sprite_size": [32, 32],
  }),
  enemy3(
  2, SpriteSubCategoryType.enemyCharacter, "images/character/enemy/enemy3.png", {
  "life": 10,
  "energy": 10,
  "atk": 10,
  "def": 10,
  "type": SpriteSubCategoryType.enemyCharacter,
  }, {
  "path": "images/character/enemy/enemy3.png",
  "sprite_size": [32, 32],
  }),
  npc1(0, SpriteSubCategoryType.npcCharacter, "images/character/npc/npc1.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.npcCharacter,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/character/npc/player1.png",
    "sprite_size": [32, 32],
  }),
  npc2(1, SpriteSubCategoryType.npcCharacter, "images/character/npc/npc2.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.npcCharacter,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/character/npc/player1.png",
    "sprite_size": [32, 32],
  }),
  npc3(2, SpriteSubCategoryType.npcCharacter, "images/character/npc/npc3.png", {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": SpriteSubCategoryType.npcCharacter,
    "rarity": RarityType.common,
    "how_ease": HowEaseType.easy,
    "theme": ThemeType.basic
  }, {
    "path": "images/character/npc/player1.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final SpriteSubCategoryType spriteSubType;
  final String spritePath;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;

  const CharacterType(
    this.id,
    this.spriteSubType,
    this.spritePath,
    this.gameParam,
    this.assetParam,
  );
}