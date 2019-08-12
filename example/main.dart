import 'package:graph_collection/graph.dart';

void main() {
  final g = Graph();

  // Base
  g.add(1);
  g.has(1);
  g.remove(1);

  // Undirected Graph
  g.link(1, 2);
  g.hasLink(1, 2);
  g.unLink(1, 2);

  // Directed Graph
  g.linkTo(1, 2);
  g.hasLinkTo(1, 2);
  g.unLinkTo(1, 2);

  // Undirected value Graph
  g.set(1, 2, 3, 4);
  g.hasEdge(1, 2, 3);
  g.get(1, 2, 3);
  g.unSet(1, 2, 3);

  g.setBy<int>(1, 2, 3);
  g.hasEdgeBy<int>(1, 2);
  g.getBy<int>(1, 2);
  g.unSetBy<int>(1, 2);

  // Directed value Graph
  g.setTo(1, 2, 3, 4);
  g.hasEdgeTo(1, 2, 3);
  g.get(1, 2, 3);
  g.unSetTo(1, 2, 3);

  g.setToBy<int>(1, 2, 3);
  g.hasEdgeToBy<int>(1, 2);
  g.getBy<int>(1, 2);
  g.unSetToBy<int>(1, 2);
}
