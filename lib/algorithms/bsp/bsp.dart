// https://varav.in/archive/dungeon/

import 'dart:core';

import 'package:logging/logging.dart';
import 'package:rogue_adventure/algorithms/bsp/extention/list2d_extention.dart';
import 'package:rogue_adventure/algorithms/bsp/processor/material_processor.dart';
import 'package:rogue_adventure/algorithms/bsp/processor/tree_processor.dart';
import 'package:rogue_adventure/algorithms/bsp/strategy/strategy_material.dart';

class BSP {
  StrategyMaterial material;
  final TreeProcessor treeProcessor = TreeProcessor();

  void execute() {
    material = treeProcessor.process();
  }

  BSP({required this.material});

}

void main() {
  Logger.root.level = Level.ALL; // すべてのログを取得します。
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  StrategyMaterial material = TreeProcessor().process();
  List<List<int>> field = MaterialProcessor(material: material).process();

  field.debugField();
}
