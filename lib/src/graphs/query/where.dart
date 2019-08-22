part of meowtype.graph;

abstract class GraphQuery_Where<F extends Function, C extends _IChain> implements _IChain<C> {
  final C _parent;
  final F _fn;

  GraphQuery_Where(this._parent, this._fn);
}

//====================================================================================================

abstract class IGraphQueryGETWhere<F extends Function, C extends _IChain> {
  GraphQuery_Where<F, C> where(F fn);
}
