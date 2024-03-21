import 'package:logging/logging.dart';
import 'package:rogue_adventure/algorithms/bsp/strategy/strategy.dart';

class StrategyExecutor {
  Logger logging = Logger("StrategyExecutor");

  execute(Strategy strategy) {
    logging.info("### ${strategy.toString()}");
    return strategy.execute();
  }

  StrategyExecutor();
}
