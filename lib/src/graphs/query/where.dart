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

abstract class IGraphQueryGETWhereT<F extends Function, C extends _IChain> {
  GraphQuery_Where<F, C> where<T>(F fn);
}

abstract class IGraphQueryGETWhereAllType<F extends Function, C extends _IChain> {
  GraphQuery_Where<F, C> whereAllType(F fn);
}
