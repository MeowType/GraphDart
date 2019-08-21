part of meowtype.graph;

/// Directed graph, but can set the direction of the edge and the value of the edge
abstract class DirectedValueGraph implements DirectedGraph {
  factory DirectedValueGraph() = FullGraph;
}
