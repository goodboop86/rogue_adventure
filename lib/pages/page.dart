import 'package:flame/components.dart';
import 'package:logging/logging.dart';
import 'package:rogue_adventure/systems/assets/image/loader.dart';

abstract class Page extends Component {
  final Logger logging = Logger('Page');
  SpriteAssets assets = SpriteAssets();

  Future<void> construct();

}