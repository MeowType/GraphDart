Provides numerous graph theory based Graph Collections

[![pub](https://img.shields.io/pub/v/graph_collection.svg)](https://pub.dev/packages/graph_collection) [![MIT](https://img.shields.io/github/license/MeowType/GraphDart)](https://github.com/MeowType/GraphDart/blob/master/LICENSE)

# Graph theory
Graph theory is the study of graphs, which are mathematical structures used to model pairwise relations between objects. A graph in this context is made up of vertices (also called nodes or points) which are connected by edges (also called links or lines).  

![Undirected](https://upload.wikimedia.org/wikipedia/commons/b/bf/Undirected.svg)
![Directed](https://upload.wikimedia.org/wikipedia/commons/a/a2/Directed.svg)

## Undirected Graph
[UndirectedGraph](https://pub.dev/documentation/graph_collection/latest/graph/UndirectedGraph-class.html)  
All edges of the undirected graph are bidirectional  

## Directed Graph
[DirectedGraph](https://pub.dev/documentation/graph_collection/latest/graph/DirectedGraph-class.html)  
All edges of the directed graph are directed from one vertex to another  

## Link Graph
[LinkGraph](https://pub.dev/documentation/graph_collection/latest/graph/LinkGraph-class.html)  
Union of directed graphs and undirected graphs  
This means that only edge relationships can be stored and values cannot be stored.  

# Multigraph
A multigraph (in contrast to a simple graph) is a graph which is permitted to have multiple edges (also called parallel edges[1]), that is, edges that have the same end nodes. Thus two vertices may be connected by more than one edge.  
![Multigraph](https://upload.wikimedia.org/wikipedia/commons/c/c9/Multi-pseudograph.svg)  

The base implementation of this library is part of the multigraph  
It allows each `key` to produce an edge, but does not allow 2 `key` equal edges  
Each `key` can represent an edge between two nodes that store values  
It is like allowing red and blue edges to exist together but not allowing 2 red or 2 blue  

## Undirected Value Graph
[UndirectedValueGraph](https://pub.dev/documentation/graph_collection/latest/graph/UndirectedValueGraph-class.html)  
An undirected graph of values can be set

## Directed Value Graph
[DirectedValueGraph](https://pub.dev/documentation/graph_collection/latest/graph/DirectedValueGraph-class.html)  
An directed graph of values can be set

## Graph
[Graph](https://pub.dev/documentation/graph_collection/latest/graph/Graph-class.html)  
Union of directed graphs, undirected graphs, directed value graphs, undirected value graphs  

---

# API reference
[API reference](https://pub.dev/documentation/graph_collection/latest/graph/graph-library.html)

# Example

```dart
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
  g.tryGet(1, 2, 3);
  g.unSet(1, 2, 3);

  g.setBy<int>(1, 2, 3);
  g.hasEdgeBy<int>(1, 2);
  g.getBy<int>(1, 2);
  g.tryGetBy<int>(1, 2);
  g.unSetBy<int>(1, 2);

  // Directed value Graph
  g.setTo(1, 2, 3, 4);
  g.hasEdgeTo(1, 2, 3);
  g.get(1, 2, 3);
  g.tryGet(1, 2, 3);
  g.unSetTo(1, 2, 3);

  g.setToBy<int>(1, 2, 3);
  g.hasEdgeToBy<int>(1, 2);
  g.getBy<int>(1, 2);
  g.tryGetBy<int>(1, 2);
  g.unSetToBy<int>(1, 2);
}
```
