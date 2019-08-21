part of meowtype.graph;

abstract class GraphQuery_Node<T, C extends _IChain> implements _IChain<C> {
  final C _parent;
  final T _node;
  final dynamic _space;

  GraphQuery_Node(
    this._parent,
    this._node, [
    this._space = NoneSpace,
  ]);
}
