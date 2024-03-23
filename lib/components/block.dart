import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:rogue_adventure/systems/config.dart';

class Block extends PositionComponent with HasGameRef{


  @override
  Future<void> onLoad() async {
    super.onLoad();
    await _loadAnimations();
  }

  Future<void> _loadAnimations() async {
    final spriteSheet = SpriteSheet(
      image: await gameRef.images.load('crate.png'),
      srcSize: Vector2.all(oneBlockSize),
    );
  }

  Block()
      : super(
    size: Vector2.all(oneBlockSize),
  );

}