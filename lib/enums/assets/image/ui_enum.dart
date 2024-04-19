import 'package:rogue_adventure/enums/assets/image/common_enum.dart';

enum UIEnum {
  button1(0, ImageTypeEnum.buttonUI, {
    "path": "images/ui/button/button1.png",
    "sprite_size": [32, 32],
  }),
  button2(1, ImageTypeEnum.buttonUI, {
    "path": "images/ui/button/button2.png",
    "sprite_size": [32, 32],
  }),
  button3(2, ImageTypeEnum.buttonUI, {
    "path": "images/ui/button/button3.png",
    "sprite_size": [32, 32],
  }),
  effect1(0, ImageTypeEnum.effectUI, {
    "path": "images/ui/effect/effect1.png",
    "sprite_size": [32, 32],
  }),
  effect2(1, ImageTypeEnum.effectUI, {
    "path": "images/ui/effect/effect2.png",
    "sprite_size": [32, 32],
  }),
  effect3(2, ImageTypeEnum.effectUI, {
    "path": "images/ui/effect/effect3.png",
    "sprite_size": [32, 32],
  }),
  icon1(0, ImageTypeEnum.iconUI, {
    "path": "images/ui/icon/icon1.png",
    "sprite_size": [32, 32],
  }),
  icon2(1, ImageTypeEnum.iconUI, {
    "path": "images/ui/icon/icon2.png",
    "sprite_size": [32, 32],
  }),
  icon3(2, ImageTypeEnum.iconUI, {
    "path": "images/ui/icon/icon3.png",
    "sprite_size": [32, 32],
  });

  final int id;
  final ImageTypeEnum type;
  final Map<String, dynamic> assetParam;

  const UIEnum(
    this.id,
    this.type,
    this.assetParam,
  );
}
