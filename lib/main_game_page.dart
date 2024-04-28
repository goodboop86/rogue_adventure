import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart' hide Route, OverlayRoute; // flutterとflameのRouteが衝突するため
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rogue_adventure/pages/dungeon_page.dart';
import 'package:rogue_adventure/pages/inventory_page.dart';
import 'package:rogue_adventure/pages/start_page.dart';

// riverpod provider
final countingStreamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (inc) => inc);
});

// flame_riverpod用key
final GlobalKey<RiverpodAwareGameWidgetState> gameWidgetKey =
    GlobalKey<RiverpodAwareGameWidgetState>();

class MainGamePage extends StatefulWidget {
  const MainGamePage({super.key});

  @override
  MainGamePageState createState() => MainGamePageState();
}

class MainGamePageState extends State<MainGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RiverpodAwareGameWidget(
        game: GameRouter(camera: CameraComponent(viewport: MaxViewport())),
        key: gameWidgetKey,
      ),
    );
  }
}


class GameRouter extends FlameGame with HasGameRef, RiverpodGameMixin {
  late final RouterComponent router;
  WorldManager worldManager = WorldManager();

  @override
  void onLoad() {
    add(
      router = RouterComponent(
        routes: {
          'dungeon': Route(() => DungeonPage(worldManager: worldManager)),
          'start': Route(() => StartPage(worldManager: worldManager)),
          'inventory': Route(() => InventoryPage(worldManager: worldManager), transparent: true),
          'ok-dialog': OverlayRoute(
                (context, game) {
              return const Center(
                child: Text(
                  'This is an overlay!',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),  // OverlayRoute
          'confirm-dialog': OverlayRoute.existing(),
        },
        initialRoute: 'start',
      ),
    );
  }

  GameRouter({required super.camera});
}

class WorldManager {
  final Map<String, World> worlds = {
    'dungeon': World(),
    'start': World(),
    'inventory': World(),
  };

  World getWorldFromName({required String name}) {
    return worlds[name]!;
  }

  WorldManager();
}
