import 'package:logging/logging.dart';
import 'package:rogue_adventure/algorithms/bsp/processor/processor.dart';
import 'package:rogue_adventure/algorithms/bsp/strategy/corridor_create_storategy.dart';
import 'package:rogue_adventure/algorithms/bsp/strategy/mst_strategy.dart';
import 'package:rogue_adventure/algorithms/bsp/strategy/strategy.dart';
import 'package:rogue_adventure/algorithms/bsp/strategy/strategy_executor.dart';
import 'package:rogue_adventure/algorithms/bsp/strategy/strategy_material.dart';

class MaterialProcessor extends Processor {
  final Logger logging = Logger("MaterialProcessor");
  late StrategyMaterial material;
  late Strategy strategy;
  StrategyExecutor executor = StrategyExecutor();

  @override
  List<List<int>> process() {
    logging.info("##### ${toString()}");
    List<StrategyType> order = [StrategyType.MST, StrategyType.CORRIDOR_CREATE];

    for (var strategyType in order) {
      switch (strategyType) {
        case StrategyType.MST:
          strategy = MSTStrategy(material: material);
          break;
        case StrategyType.CORRIDOR_CREATE:
          strategy = CorridorCreateStrategy(material: material);
          break;
      }
      material = executor.execute(strategy);
      // material.trace();
    }

    return material.field;

  }

  MaterialProcessor({required this.material});
  // NOTE: contextをすぐ作り替えたいので、メンバ変数として持つのは微妙...
}

enum StrategyType { MST, CORRIDOR_CREATE }
