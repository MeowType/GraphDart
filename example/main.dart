import 'package:graph_lib/graph.dart';

void main() {
  final g = Graph();

  g.add(1);
  g.has(1);
  g.remove(1);

  g.link(1, 2);
  g.hasLink(1, 2);
  g.unLink(1, 2);

  g.linkTo(1, 2);
  g.hasLinkTo(1, 2);
  g.unLinkTo(1, 2);

  g.set(1, 2, 3, 4);
  g.hasEdge(1, 2, 3);
  g.get(1, 2, 3);
  g.unSet(1, 2, 3);

  g.setBy<int>(1, 2, 3);
  g.hasEdgeBy<int>(1, 2);
  g.getBy<int>(1, 2);
  g.unSetBy<int>(1, 2);

  g.setTo(1, 2, 3, 4);
  g.hasEdgeTo(1, 2, 3);
  g.get(1, 2, 3);
  g.unSetTo(1, 2, 3);

  g.setToBy<int>(1, 2, 3);
  g.hasEdgeToBy<int>(1, 2);
  g.getBy<int>(1, 2);
  g.unSetToBy<int>(1, 2);
}
