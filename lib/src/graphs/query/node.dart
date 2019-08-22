part of meowtype.graph;

abstract class GraphQuery_Node<T> implements _IChain {
  final T _node;
  final dynamic _space;

  GraphQuery_Node(
    this._node, [
    this._space = NoneSpace,
  ]);
}

//====================================================================================================

abstract class IGraphQueryGETNode {
  GraphQuery_Node node(node, [space = NoneSpace]);

  GraphQuery_Node<T> nodeBy<T>(T node, [space = NoneSpace]);
}

mixin GraphQueryGETNodeMixin<Node extends GraphQuery_Node> implements IGraphQueryGETNode {
  Node node(node, [space = NoneSpace]) => this.nodeBy<dynamic>(node, space);
}
