part of meowtype.graph;

class GraphQuery_Base_Has extends GraphQuery<GraphBase, GraphQuery_Base_Has>
    with GraphQueryGETNodeMixin<GraphQuery_Base_Has_Node, GraphQuery_Base_Has>
    implements
        IGraphQueryGETNode<GraphQuery_Base_Has>,
        IGraphQueryGETSpace<GraphQuery_Base_Has>,
        IGraphQueryGETSpaceAllType<GraphQuery_Base_Has>,
        IGraphQueryGETWhereT<_GraphQuery_Base_Has_Space_Where_FN, GraphQuery_Base_Has> {
  GraphQuery_Base_Has(IGraph graph) : super(graph);

  GraphQuery_Base_Has_Node<T> nodeBy<T>(T node, [space = NoneSpace]) => GraphQuery_Base_Has_Node<T>(this, node, space);
  GraphQuery_Base_Has_Space<T> space<T>([space = NoneSpace]) => GraphQuery_Base_Has_Space<T>(this, space);
  GraphQuery_Base_Has_Space_AllType spaceAllType([space = NoneSpace]) => GraphQuery_Base_Has_Space_AllType(this, space);
  GraphQuery_Base_Has_Where<T> where<T>(_GraphQuery_Base_Has_Space_Where_FN fn) => GraphQuery_Base_Has_Where<T>(this, fn);
}

class GraphQuery_Base_Has_Node<T> extends GraphQuery_Node<T, GraphQuery_Base_Has> implements GraphQuery_End<bool> {
  GraphQuery_Base_Has_Node(GraphQuery_Base_Has parent, T node, [space = NoneSpace]) : super(parent, node, space);

  bool get end => _parent._graph._has(_node, _space);
}

class GraphQuery_Base_Has_Space<T> extends GraphQuery_Space<T, GraphQuery_Base_Has> implements IGraphQueryGETWhere<_GraphQuery_Base_Has_Space_Where_FN, GraphQuery_Base_Has_Space> {
  GraphQuery_Base_Has_Space(GraphQuery_Base_Has parent, [space = NoneSpace]) : super(parent, space);

  GraphQuery_Base_Has_Space_Where<T> where(_GraphQuery_Base_Has_Space_Where_FN fn) => GraphQuery_Base_Has_Space_Where(this, fn);
}

class GraphQuery_Base_Has_Space_AllType extends GraphQuery_Space_AllType<GraphQuery_Base_Has> implements IGraphQueryGETWhere<_GraphQuery_Base_Has_Space_Where_FN, GraphQuery_Base_Has_Space_AllType> {
  GraphQuery_Base_Has_Space_AllType(GraphQuery_Base_Has parent, [space = NoneSpace]) : super(parent, space);

  GraphQuery_Base_Has_Space_Where_AllType where(_GraphQuery_Base_Has_Space_Where_FN fn) => GraphQuery_Base_Has_Space_Where_AllType(this, fn);
}

typedef _GraphQuery_Base_Has_Space_Where_FN = bool Function(dynamic node);

class GraphQuery_Base_Has_Space_Where<T> extends GraphQuery_Where<_GraphQuery_Base_Has_Space_Where_FN, GraphQuery_Base_Has_Space> implements GraphQuery_End<bool> {
  GraphQuery_Base_Has_Space_Where(GraphQuery_Base_Has_Space parent, _GraphQuery_Base_Has_Space_Where_FN fn) : super(parent, fn);

  bool get end => _parent._parent._graph._find_allBy<T>(Some(_parent._space)).any((box) => _fn(box.node));
}

class GraphQuery_Base_Has_Space_Where_AllType extends GraphQuery_Where<_GraphQuery_Base_Has_Space_Where_FN, GraphQuery_Base_Has_Space_AllType> implements GraphQuery_End<bool> {
  GraphQuery_Base_Has_Space_Where_AllType(GraphQuery_Base_Has_Space_AllType parent, _GraphQuery_Base_Has_Space_Where_FN fn) : super(parent, fn);

  bool get end => _parent._parent._graph._find_all(Some(_parent._space)).any((box) => _fn(box.node));
}

class GraphQuery_Base_Has_Where<T> extends GraphQuery_Where<_GraphQuery_Base_Has_Space_Where_FN, GraphQuery_Base_Has> implements GraphQuery_End<bool> {
  GraphQuery_Base_Has_Where(GraphQuery_Base_Has parent, _GraphQuery_Base_Has_Space_Where_FN fn) : super(parent, fn);

  bool get end => _parent._parent._graph._find_allBy<T>(None()).any((box) => _fn(box.node));
}

class GraphQuery_Base_Has_Where_AllType extends GraphQuery_Where<_GraphQuery_Base_Has_Space_Where_FN, GraphQuery_Base_Has> implements GraphQuery_End<bool> {
  GraphQuery_Base_Has_Where_AllType(GraphQuery_Base_Has parent, _GraphQuery_Base_Has_Space_Where_FN fn) : super(parent, fn);

  bool get end => _parent._parent._graph._find_all(None()).any((box) => _fn(box.node));
}
