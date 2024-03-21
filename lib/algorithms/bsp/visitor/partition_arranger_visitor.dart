import 'package:rogue_adventure/algorithms/bsp/structure/partition.dart';
import 'package:rogue_adventure/algorithms/bsp/visitor/visitor.dart';
import 'package:rogue_adventure/algorithms/bsp/extention/list2d_extention.dart';

class PartitionArrangerVisitor extends Visitor {
  @override
  List<List<int>> visit(Partition partition, {bool isDebug = false}) {
    this.isDebug = isDebug;
    return partition.acceptPartitionArrangerVisitor(this);
  }

  @override
  List<List<int>> execute(Partition p) {
    // ここではtp=pとしない。tpは再帰呼び出しの最後のedgeの情報を持つため
    // 最後に返却された結合配列がrootに対する戻り値であるのに対しif文を通り抜けてしまう。

    if (shouldExecute(p)) {
      //要素2
      List<List<List<int>>> pair = [];
      for (var child in p.children) {
        pair.add(execute(child));
      }

      List<List<int>> merged = [];
      if (p.getSplitAxis == "horizontal") {
        merged = pair[0] + pair[1];
      } else if (p.getSplitAxis == "vertical") {
        for (int i = 0; i < pair[0].length; i++) {
          merged.addAll([pair[0][i] + pair[1][i]]);
        }
      } else {
        // 無い想定
        throw Exception("$PartitionArrangerVisitor");
      }

      p.arrangedRect = merged;
      isDebug ? trace(p) : null;
      return p.getArrangedRect;
    } else {
      p.arrangedRect = p.rect;
      return p.getArrangedRect;
    }
  }

  @override
  bool shouldExecute(Partition p) {
    return p.children.isNotEmpty;
  }

  @override
  void trace(Partition p) {
    logging
        .info("Root: ${p.isRoot}, depth: ${p.depth}/${p.config.dungeonDepth}, "
            "Debug: ${p.getIsDebug} "
            "name: ${p.name}, Split axis: ${p.getSplitAxis} "
            "(bias: ±${p.getSplitAxisBias}), Sprit ratio: ${p.getSplitRatio} "
            "(bias: ±${p.getSplitRatioBias})");
    List<List<int>> rect = p.getArrangedRect;
    rect.debugField();
  }

  PartitionArrangerVisitor({required config}) : super(config);
}
