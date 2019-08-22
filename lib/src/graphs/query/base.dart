part of meowtype.graph;

abstract class GraphQuery<G extends IGraph, C extends _IChain> implements IGraphQueryGETNode<C>, _IChain<Null> {
  final Null _parent = null;
  final G _graph;

  GraphQuery(this._graph);
}
