import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'blocks/blocks.dart';

class FloorComponent extends Component {
  void glowAroundComponentFromCoordinate(Vector2 target) {
    for (var child in children) {
      final block = child as Blocks;
      if ((target.x - block.coordinate.x).abs() <= 1 &&
          (target.y - block.coordinate.y).abs() <= 1) {
        child.add(SequenceEffect([
          OpacityEffect.to(
            0.5,
            EffectController(duration: 0.2),
          ),
          OpacityEffect.to(
            1,
            EffectController(duration: 0.2),
          ),
        ]));
      }
    }
  }
  FloorComponent({
    required super.key,
  });
}
