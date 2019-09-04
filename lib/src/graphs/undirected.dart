part of meowtype.graph;

/// Undirected graph, Can create an edge between 2 nodes
abstract class UndirectedGraph implements IGraph {
  factory UndirectedGraph() = FullGraph;
}