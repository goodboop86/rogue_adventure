// see: https://medium.com/@sadigrzazada20/a-minimum-spanning-tree-mst-85c6f881d28a
import 'package:rogue_adventure/algorithms/bsp/area.dart';
import 'package:rogue_adventure/algorithms/bsp/strategy/strategy.dart';
import 'package:rogue_adventure/algorithms/bsp/strategy/strategy_material.dart';
import 'package:rogue_adventure/algorithms/bsp/structure/partition.dart';

class Edge {
  late int source;
  late int destination;
  late int weight;

  @override
  String toString() {
    return "Source: $source, Destination: $destination, Weight: $weight";
  }

  Edge({required this.source, required this.destination, required this.weight});
}

class MSTStrategy extends Strategy {
  @override
  StrategyMaterial execute() {
    ({List<Partition> leafs, List<Edge> edge}) target = createEdges();
    List<Edge> mstEdge = kruskalMST(target.edge, target.leafs.length);

    return StrategyMaterial(
        leafs: target.leafs, edges: mstEdge, field: material.field);
  }

  @override
  void trace() {}

  int findParent(List<int> parent, int vertex) {
    if (parent[vertex] == -1) {
      return vertex;
    }
    return findParent(parent, parent[vertex]);
  }

  void union(List<int> parent, int x, int y) {
    int xSet = findParent(parent, x);
    int ySet = findParent(parent, y);
    parent[xSet] = ySet;
  }

  ({List<Partition> leafs, List<Edge> edge}) createEdges() {
    List<Partition> targetLeafs = [];
    for (Partition p in material.leafs) {
      if (p.hasRoomArea) {
        targetLeafs.add(p);
      }
    }

    List<Edge> edges = [];
    for (int i = 0; i < targetLeafs.length; i++) {
      for (int j = i + 1; j < targetLeafs.length; j++) {
        Point source = targetLeafs[i].absRoomArea.center();
        Point destination = targetLeafs[j].absRoomArea.center();
        edges.add(Edge(
            source: i,
            destination: j,
            weight: source.squaredDistanceOf(destination).toInt()));
      }
    }
    ({List<Partition> leafs, List<Edge> edge}) target =
        (leafs: targetLeafs, edge: edges);
    return target;
  }

  List<Edge> kruskalMST(List<Edge> edges, int numberOfVertices) {
    List<Edge> minimumSpanningTree = [];

    // グラフ内のすべてのエッジを重みに従って昇順に並べ替え
    edges.sort((a, b) => a.weight.compareTo(b.weight));

    //parentを初期化
    List<int> parent = List.generate(numberOfVertices, (j) => -1);

    for (Edge edge in edges) {
      int x = findParent(parent, edge.source);
      int y = findParent(parent, edge.destination);
      if (x != y) {
        minimumSpanningTree.add(edge);
        union(parent, x, y);
      }
    }
    return minimumSpanningTree;
  }

  MSTStrategy({required super.material});
}
