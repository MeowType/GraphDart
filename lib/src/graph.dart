library MeowType.Graph;

import 'maybe.dart';

part 'node.dart';
part 'utils.dart';
part './graphs/items.dart';
part './graphs/directed.dart';
part './graphs/directed.value.dart';
part './graphs/undirected.dart';
part './graphs/undirected.value.dart';
part './graphs/get.dart';
part './graphs/full.dart';

abstract class LinkGraph implements UndirectedGraph, DirectedGraph {
  factory LinkGraph() => FullGraph();
}

abstract class Graph extends LinkGraph
    implements UndirectedValueGraph, DirectedValueGraph {
  factory Graph() => FullGraph();
}