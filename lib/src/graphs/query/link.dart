part of meowtype.graph;

abstract class IGraphQuery_Link {}

abstract class GraphQuery_Link<T> extends IGraphQuery_Link {
  final Maybe<T> _value;
  final dynamic _space;

  GraphQuery_Link([this._space = NoneSpace, this._value]);
}

abstract class GraphQuery_LinkTo<T> extends IGraphQuery_Link {
  final Maybe<T> _value;
  final dynamic _space;

  GraphQuery_LinkTo([this._space = NoneSpace, this._value]);
}
