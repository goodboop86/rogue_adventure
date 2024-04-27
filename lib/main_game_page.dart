import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Route; // flutterとflameのRouteが衝突するため
import 'package:rogue_adventure/pages/dungeon_page.dart';
import 'package:rogue_adventure/pages/inventory_page.dart';
import 'package:rogue_adventure/pages/start_page.dart';

class MainGamePage extends StatefulWidget {
  const MainGamePage({super.key});

  @override
  MainGamePageState createState() => MainGamePageState();
}

class MainGamePageState extends State<MainGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: GameRouter(
            camera:
                CameraComponent(viewport: MaxViewport())),
      ),
    );
  }
}

Widget _pauseMenuBuilder(BuildContext buildContext, DungeonPage game) {
  return Center(
    child: Container(
      width: 100,
      height: 100,
      color: Colors.orange,
      child: const Center(
        child: Text('Paused'),
      ),
    ),
  );
}


class GameRouter extends FlameGame with KeyboardEvents, HasGameRef {
  late final RouterComponent router;
  WorldManager worldManager = WorldManager();

  @override
  void onLoad() {
    add(
      router = RouterComponent(
        routes: {
          'dungeon': Route(() => DungeonPage(worldManager: worldManager)),
          'start': Route(() => StartPage(worldManager: worldManager)),
          'inventory': Route(InventoryPage.new),
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
  };
  
  World getWorldFromName({required String name}) {
    return worlds[name]!;
  }
  WorldManager();
}