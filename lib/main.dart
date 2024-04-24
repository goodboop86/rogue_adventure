import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:rogue_adventure/game/main_game_page.dart';

final countingStreamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (inc) => inc);
});

void main() {
  Logger.root.level = Level.ALL; // すべてのログを取得します。
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'RogueAdventure',
      home: MainGamePage(),
    );
  }
}