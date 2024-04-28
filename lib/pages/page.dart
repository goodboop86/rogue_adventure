import 'package:flame/components.dart';
import 'package:logging/logging.dart';
import 'package:rogue_adventure/main_game_page.dart';
import 'package:rogue_adventure/systems/assets/image/loader.dart';

abstract class Page extends Component {
  final Logger logging = Logger('Page');
  SpriteAssets assets = SpriteAssets();
  late WorldManager worldManager;

  Future<void> construct();

  Page({required this.worldManager});

}