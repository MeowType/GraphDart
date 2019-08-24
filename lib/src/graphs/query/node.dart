part of meowtype.graph;

abstract class GraphQuery_Node<T> {
  final T _node;
  final dynamic _space;

  GraphQuery_Node(
    this._node, [
    this._space = NoneSpace,
  ]);
}