import 'package:rogue_adventure/enums/assets/image/common_enum.dart';

enum PlayerEnum {
  player1(0, ImageTypeEnum.playerCharacter, {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": ImageTypeEnum.playerCharacter,
  }, {
    "path": "images/character/player/player1.png",
    "sprite_size": [32, 32],
  }),
  player2(1, ImageTypeEnum.playerCharacter, {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": ImageTypeEnum.playerCharacter,
  }, {
    "path": "images/character/player/player2.png",
    "sprite_size": [32, 32],
  }),
  player3(2, ImageTypeEnum.playerCharacter, {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": ImageTypeEnum.playerCharacter,
  }, {
    "path": "images/character/player/player3.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final ImageTypeEnum imageType;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;

  const PlayerEnum(
    this.id,
    this.imageType,
    this.gameParam,
    this.assetParam,
  );
}

enum EnemyEnum {
  enemy1(0, ImageTypeEnum.enemyCharacter, {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": ImageTypeEnum.enemyCharacter,
  }, {
    "path": "images/character/enemy/enemy1.png",
    "sprite_size": [32, 32],
  }),
  enemy2(1, ImageTypeEnum.enemyCharacter, {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": ImageTypeEnum.enemyCharacter,
  }, {
    "path": "images/character/enemy/enemy2.png",
    "sprite_size": [32, 32],
  }),
  enemy3(2, ImageTypeEnum.enemyCharacter, {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": ImageTypeEnum.enemyCharacter,
  }, {
    "path": "images/character/enemy/enemy3.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final ImageTypeEnum imageType;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;

  const EnemyEnum(
    this.id,
    this.imageType,
    this.gameParam,
    this.assetParam,
  );
}

enum NPCEnum {
  npc1(0, ImageTypeEnum.npcCharacter, {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": ImageTypeEnum.npcCharacter,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/character/npc/player1.png",
    "sprite_size": [32, 32],
  }),
  npc2(1, ImageTypeEnum.npcCharacter, {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": ImageTypeEnum.npcCharacter,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/character/npc/player1.png",
    "sprite_size": [32, 32],
  }),
  npc3(2, ImageTypeEnum.npcCharacter, {
    "life": 10,
    "energy": 10,
    "atk": 10,
    "def": 10,
    "type": ImageTypeEnum.npcCharacter,
    "rarity": RarityEnum.common,
    "how_ease": HowEaseEnum.easy,
    "theme": ThemeEnum.basic
  }, {
    "path": "images/character/npc/player1.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final ImageTypeEnum imageType;
  final Map<String, dynamic> gameParam;
  final Map<String, dynamic> assetParam;

  const NPCEnum(
    this.id,
    this.imageType,
    this.gameParam,
    this.assetParam,
  );
}
