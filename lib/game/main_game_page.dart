import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:rogue_adventure/game/game.dart';

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

Widget _pauseMenuBuilder(BuildContext buildContext, MainGame game) {
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