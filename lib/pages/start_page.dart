import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:rogue_adventure/main_game_page.dart';
import 'package:rogue_adventure/pages/page.dart';

class StartPage extends Page with HasGameRef<GameRouter> {
  @override
  Future<void> onLoad() async {
    game.world = worldManager.getWorldFromName(name: 'start');

    await assets.loadAssets();
    super.onLoad();

    await construct();
  }

  @override
  Future<void> construct() async {
    await createUI();
  }


  createUI() async {
    double gameWidth = game.size.x;
    double gameHeight = game.size.y;
    int ratioOfGameSize = 16;
    double section = gameWidth / ratioOfGameSize;

    Sprite inventoryButtonSprite = assets.getSpriteEntityFromID(id: 800).sprite;
    SpriteButtonComponent inventoryButton = SpriteButtonComponent(
      button: inventoryButtonSprite,
      buttonDown: inventoryButtonSprite,
    )
      ..position = Vector2(game.size.x/2 - section/2, game.size.y/2 - section/2)
      ..size = Vector2.all(section)
      ..onPressed = () {
        game.world = worldManager.getWorldFromName(name: 'dungeon');
      game.router.pushNamed('dungeon');};
    addAll([inventoryButton, RiverpodAwareTextComponent()]);
  }

  StartPage({required super.worldManager});
}

class RiverpodAwareTextComponent extends PositionComponent
    with RiverpodComponentMixin, HasGameRef<GameRouter> {
  late TextComponent textComponent;
  int currentValue = 0;

  /// [onMount] should be used over [onLoad] to initialize subscriptions,
  /// which is only called if the [Component] was mounted.
  /// Cancellation is handled for the user automatically inside [onRemove].
  ///
  /// [RiverpodComponentMixin.addToGameWidgetBuild] **must** be invoked in
  /// your Component **before** [RiverpodComponentMixin.onMount] in order to
  /// have the provided function invoked on
  /// [RiverpodAwareGameWidgetState.build].
  ///
  /// From `flame_riverpod` 5.0.0, [WidgetRef.watch], is also accessible from
  /// components.
  @override
  void onMount() {
    addToGameWidgetBuild(() {
      ref.listen(countingStreamProvider, (p0, p1) {
        if (p1.hasValue) {
          currentValue = p1.value!;
          textComponent.text = '$currentValue';
        }
      });
    });
    super.onMount();
    add(textComponent = TextComponent(position: game.size/2 + Vector2(0,100)));
  }
}

