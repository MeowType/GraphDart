part of meowtype.graph;

class FindBoxBy<T> extends FindBox {
  final T node;
  FindBoxBy(this.node, space) : super(node, space, T);
}

class FindBox {
  final dynamic node;
  final dynamic space;
  final Type type;
  FindBox(this.node, this.space, this.type);
}
