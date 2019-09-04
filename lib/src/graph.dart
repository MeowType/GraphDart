library meowtype.graph;

import 'dart:async';
import 'dart:collection';

import 'package:some/index.dart';
import 'package:ref_out_box/ref_out_box.dart';
import 'package:ref_out_box/api.dart';

import './other/utils.dart';
import './query/query.dart';
import './query/full/add.dart' as base_add;
import './query/full/has.dart' as base_has;
import './query/full/remove.dart' as base_remove;

part 'node.dart';
part 'utils.dart';
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
