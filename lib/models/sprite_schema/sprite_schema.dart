abstract class SpriteSchema {
  late int id;
  late String path;
  late int spriteWidth;
  late int spriteHeight;

  SpriteSchema({
    required this.id,
    required this.path,
    required this.spriteWidth,
    required this.spriteHeight,
  });
}
