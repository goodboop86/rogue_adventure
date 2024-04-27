import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Route; // flutterとflameのRouteが衝突するため
import 'package:rogue_adventure/pages/dungeon_page.dart';
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

  @override
  void onLoad() {
    add(
      router = RouterComponent(
        routes: {
          'home': Route(DungeonPage.new),
          'start': Route(StartPage.new),
        },
        initialRoute: 'start',
      ),
    );
  }
  GameRouter({required super.camera});
}