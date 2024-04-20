
import 'package:flame/components.dart';
import 'package:rogue_adventure/assets/image/common_type.dart';

class SpriteEntity {
  late int id;
  late SpriteCategoryType spriteType;
  late Sprite sprite;
  late Map<String, dynamic> assetParam;
  late Map<String, dynamic> gameParam;

  SpriteEntity( {
    required this.id,
    required this.sprite,
    required this.assetParam,
    required this.gameParam,
  });
}


class SpriteTypeLoader {
  static Future<Sprite> loadImage(String path) async {
    return await Sprite.load(path);
  }

  static Future<Map<SpriteCategoryType, Map<SpriteSubCategoryType, SpriteEntity>>> loadAssets() async {
    Map<SpriteCategoryType, Map<SpriteSubCategoryType, SpriteEntity>> assets = {};
    for(var spriteCategory in SpriteCategoryType.values) {
      loadAsset(spriteCategory).then((value) {
        assets[spriteCategory] = value;
      });
    }
    return assets;
  }


    static Future<Map<SpriteSubCategoryType, SpriteEntity>> loadAsset(SpriteCategoryType spriteType) async {
      Map<SpriteSubCategoryType, SpriteEntity> asset = {};
      for (var e in spriteType.myType.values) {
        Sprite sprite = await loadImage(e.spritePath);

        SpriteEntity entity = SpriteEntity(
          id: e.id,
          sprite: sprite,
          assetParam: e.assetParam,
          gameParam: e.gameParam,
        );
        asset[e.spriteSubType as SpriteSubCategoryType] = entity;
      }
      return asset;
    }



  }