part of meowtype.graph;

const NoneSpace = #meowtype.graph.nonespace;

/// Basic graph node collection
abstract class GraphBase implements Iterable, IGraph {
  final Map<dynamic, Map<dynamic, Map<_Node, dynamic>>> _node_to_val = {};
  final Map<dynamic, Map<dynamic, Map<dynamic, _Node>>> _map = {};

  GraphQueryAdd get add => GraphQueryAdd(this);
}

//==================================================

abstract class GraphQuery {
  final IGraph _graph;
  GraphQuery(this._graph);

  GraphQuery_Node node(node, [space = NoneSpace]) =>
      this.nodeBy<dynamic>(node, space);

  GraphQuery_Node nodeBy<T>(T node, [space = NoneSpace]);
}

class GraphQueryAdd extends GraphQuery {
  GraphQueryAdd(IGraph graph) : super(graph);

  GraphQueryAdd_Node node(node, [space = NoneSpace]) =>
      this.nodeBy<dynamic>(node, space);

  GraphQueryAdd_Node nodeBy<T>(T node, [space = NoneSpace]) =>
      GraphQueryAdd_Node<T>(this, node, space);
}

//==================================================

abstract class GraphQuery_Node<T> {
  final GraphQuery _query;
  final T _node;
  final dynamic _space;
  GraphQuery_Node(this._query, this._node, [this._space = NoneSpace]);
}

class GraphQueryAdd_Node<T> extends GraphQuery_Node<T> {
  GraphQueryAdd_Node(GraphQuery query, T node, [space = NoneSpace])
      : super(query, node, space);
}

//==================================================

enum IsDirected { Yes, No }

abstract class GraphQuery_Link<T> {
  final IsDirected _isDirected;
  final Maybe<T> _value;
  final dynamic _space;
  GraphQuery_Link(this._isDirected, [this._space = NoneSpace, this._value]);
}

class GraphQueryAdd_Link<T> extends GraphQuery_Link<T> {
  GraphQueryAdd_Link(IsDirected isDirected, [space = NoneSpace, Maybe<T> value])
      : super(isDirected, space, value);
}
