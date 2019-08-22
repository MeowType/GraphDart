library meowtype.graph;

import 'dart:async';

import 'package:some/index.dart';
import 'dart:collection';

part 'node.dart';
part 'utils.dart';
part './graphs/query/base.dart';
part './graphs/query/node.dart';
part './graphs/query/link.dart';
part './graphs/query/find.dart';
part './graphs/query/space.dart';
part './graphs/query/where.dart';
part './graphs/query/end.dart';
part './graphs/query/utils.dart';
part './graphs/query/base/add.dart';
part './graphs/query/base/has.dart';
part './graphs/items.dart';
part './graphs/directed.dart';
part './graphs/directed.value.dart';
part './graphs/undirected.dart';
part './graphs/undirected.value.dart';
part './graphs/full.dart';

abstract class IGraph {}

/// Contains [DirectedGraph] and [UndirectedGraph], And can't set the value of the edge
abstract class LinkGraph implements UndirectedGraph, DirectedGraph {
  factory LinkGraph() = FullGraph;
}

/// Contains all types of Graph, The difference with [LinkGraph] is that you can set the value of the edge.
abstract class Graph extends LinkGraph implements UndirectedValueGraph, DirectedValueGraph {
  factory Graph() = FullGraph;
}
