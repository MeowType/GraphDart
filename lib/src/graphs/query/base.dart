part of meowtype.graph;

abstract class IGraphQueryGETNode<C extends _IChain> {
  GraphQuery_Node node(node, [space = NoneSpace]);

  GraphQuery_Node<T, C> nodeBy<T>(T node, [space = NoneSpace]);
}

mixin GraphQueryGETNodeMixin<Node extends GraphQuery_Node<dynamic, C>, C extends _IChain> implements IGraphQueryGETNode<C> {
  Node node(node, [space = NoneSpace]) => this.nodeBy<dynamic>(node, space);
}

//====================================================================================================

abstract class IGraphQueryGETLink {
  GraphQuery_Link<L> link<L>({space = NoneSpace, Maybe<L> value});
  GraphQuery_LinkTo<L> linkTo<L>({space = NoneSpace, Maybe<L> value});
}

//====================================================================================================

abstract class GraphQuery<G extends IGraph, C extends _IChain> implements IGraphQueryGETNode<C>, _IChain<Null> {
  final Null _parent = null;
  final G _graph;

  GraphQuery(this._graph);
}
