import 'package:flame/components.dart';
import 'package:rogue_adventure/systems/assets/image/category/block_type.dart';
import 'package:rogue_adventure/systems/assets/image/category/character_type.dart';
import 'package:rogue_adventure/systems/assets/image/common_type.dart';
import 'package:rogue_adventure/systems/assets/image/category/consumable_type.dart';
import 'package:rogue_adventure/systems/assets/image/category/equipment_type.dart';
import 'package:rogue_adventure/systems/assets/image/category/ui_type.dart';

class SpriteEntity {
  late String name;
  late int id;
  late SpriteCategoryType spriteCategory;
  late SpriteSubCategoryType spriteSubCategory;
  late Sprite sprite;
  late Map<String, dynamic> assetParam;
  late Map<String, dynamic> gameParam;

  SpriteEntity({
    required this.name,
    required this.id,
    required this.spriteCategory,
    required this.spriteSubCategory,
    required this.sprite,
    required this.assetParam,
    required this.gameParam,
  });

  getSpriteComponent() {
    return SpriteComponent(
      sprite: sprite,
      size: Vector2(assetParam['sprite_size'][0], assetParam['sprite_size'][1]),
    );
  }

}

class SpriteAssets {
  List<List<dynamic>> spriteAssets = [
    BlockType.values,
    CharacterType.values,
    ConsumableType.values,
    EquipmentType.values,
  ];

  List<SpriteEntity> assets = [];

  SpriteEntity getSpriteEntityFromID({required int id}) {
    return assets.firstWhere((e) => e.id == id);
  }

  Future<Sprite> loadImage(String path) async {
    return await Sprite.load(path);
  }

  Future<void> loadAssets() async {
    List<List<dynamic>> spriteAssets = [
      BlockType.values,
      CharacterType.values,
      ConsumableType.values,
      EquipmentType.values,
      UIType.values
    ];
    for (var asset in spriteAssets) {
      List<SpriteEntity> entities = await loadAsset(asset);
       assets.addAll(entities);
      }
    }

  Future<List<SpriteEntity>> loadAsset(List<dynamic> elements) async {
    List<SpriteEntity> asset = [];
    for (var e in elements) {
      Sprite sprite = await loadImage(e.spritePath);

      SpriteEntity entity = SpriteEntity(
        name: e.toString(),
        id: e.id,
        spriteCategory: e.myType,
        spriteSubCategory: e.spriteSubCategory,
        sprite: sprite,
        assetParam: e.assetParam,
        gameParam: e.gameParam,
      );
      asset.add(entity);
    }
    return asset;
  }

}
