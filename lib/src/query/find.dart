part of meowtype.graph.query;

class FindBox<T> {
  final T node;
  final dynamic space;
  FindBox(this.node, this.space);
}

enum LinkDirection { Mutual, ToRight, ToLeft }
