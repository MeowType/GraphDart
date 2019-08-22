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

//====================================================================================================

abstract class IGraphQueryGETNode<C extends _IChain> {
  GraphQuery_Node<dynamic, C> node(node, [space = NoneSpace]);

  GraphQuery_Node<T, C> nodeBy<T>(T node, [space = NoneSpace]);
}

mixin GraphQueryGETNodeMixin<Node extends GraphQuery_Node<dynamic, C>, C extends _IChain> implements IGraphQueryGETNode<C> {
  Node node(node, [space = NoneSpace]) => this.nodeBy<dynamic>(node, space);
}
