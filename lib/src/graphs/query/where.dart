part of meowtype.graph;

abstract class GraphQuery_Where<F extends Function> implements _IChain {
  final F _fn;

  GraphQuery_Where(this._fn);
}

//====================================================================================================

abstract class IGraphQueryGETWhere<F extends Function> {
  GraphQuery_Where<F> where(F fn);
}

abstract class IGraphQueryGETWhereT<F extends Function> {
  GraphQuery_Where<F> where<T>(F fn);
}

abstract class IGraphQueryGETWhereAllType<F extends Function> {
  GraphQuery_Where<F> whereAllType(F fn);
}
