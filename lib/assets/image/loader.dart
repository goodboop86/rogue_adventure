import 'package:flame/components.dart';
import 'package:rogue_adventure/assets/image/category/block_type.dart';
import 'package:rogue_adventure/assets/image/category/character_type.dart';
import 'package:rogue_adventure/assets/image/common_type.dart';
import 'package:rogue_adventure/assets/image/category/consumable_type.dart';
import 'package:rogue_adventure/assets/image/category/equipment_type.dart';
import 'package:rogue_adventure/assets/image/category/ui_type.dart';

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
}

class SpriteAssets {
  List<List<dynamic>> spriteAssets = [
    BlockType.values,
    CharacterType.values,
    ConsumableType.values,
    EquipmentType.values,
  ];

  //List<SpriteEntity> assets = [];

  Future<Sprite> loadImage(String path) async {
    return await Sprite.load(path);
  }

  Future<List<SpriteEntity>> loadAssets() async {
    List<List<dynamic>> spriteAssets = [
      BlockType.values,
      CharacterType.values,
      ConsumableType.values,
      EquipmentType.values,
      UIType.values
    ];
    List<SpriteEntity> assets = [];
    for (var asset in spriteAssets) {
      List<SpriteEntity> entities = await loadAsset(asset);
       assets.addAll(entities);
      }
    return assets;
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
