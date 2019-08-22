part of meowtype.graph;

class GraphQuery_Base_Has extends GraphQuery
    with GraphQueryGETNodeMixin<GraphQuery_Base_Has_Node>
    implements
        IGraphQueryGETNode,
        IGraphQueryGETSpace,
        IGraphQueryGETSpaceAllType,
        IGraphQueryGETWhereT<_GraphQuery_Base_Has_Space_Where_FN>,
        IGraphQueryGETWhereAllType<_GraphQuery_Base_Has_Space_Where_FN> {
  GraphBase _parent;

  GraphQuery_Base_Has(this._parent) : super();

  GraphQuery_Base_Has_Node<T> nodeBy<T>(T node, [space = NoneSpace]) => GraphQuery_Base_Has_Node<T>(this, node, space);
  GraphQuery_Base_Has_Space<T> space<T>([space = NoneSpace]) => GraphQuery_Base_Has_Space<T>(this, space);
  GraphQuery_Base_Has_Space_AllType spaceAllType([space = NoneSpace]) => GraphQuery_Base_Has_Space_AllType(this, space);
  GraphQuery_Base_Has_Where<T> where<T>(_GraphQuery_Base_Has_Space_Where_FN fn) => GraphQuery_Base_Has_Where<T>(this, fn);
  GraphQuery_Base_Has_Where_AllType whereAllType(_GraphQuery_Base_Has_Space_Where_FN fn) => GraphQuery_Base_Has_Where_AllType(this, fn);
}

class GraphQuery_Base_Has_Node<T> extends GraphQuery_Node<T> implements GraphQuery_End<bool> {
  GraphQuery_Base_Has _parent;

  GraphQuery_Base_Has_Node(this._parent, T node, [space = NoneSpace]) : super(node, space);

  bool get end => _parent._parent._has(_node, _space);
}

class GraphQuery_Base_Has_Space<T> extends GraphQuery_Space<T> implements IGraphQueryGETWhere<_GraphQuery_Base_Has_Space_Where_FN> {
  GraphQuery_Base_Has _parent;

  GraphQuery_Base_Has_Space(this._parent, [space = NoneSpace]) : super(space);

  GraphQuery_Base_Has_Space_Where<T> where(_GraphQuery_Base_Has_Space_Where_FN fn) => GraphQuery_Base_Has_Space_Where(this, fn);
}

class GraphQuery_Base_Has_Space_AllType extends GraphQuery_Space_AllType implements IGraphQueryGETWhere<_GraphQuery_Base_Has_Space_Where_FN> {
  GraphQuery_Base_Has _parent;

  GraphQuery_Base_Has_Space_AllType(this._parent, [space = NoneSpace]) : super(space);

  GraphQuery_Base_Has_Space_Where_AllType where(_GraphQuery_Base_Has_Space_Where_FN fn) => GraphQuery_Base_Has_Space_Where_AllType(this, fn);
}

typedef _GraphQuery_Base_Has_Space_Where_FN = bool Function(dynamic node);

class GraphQuery_Base_Has_Space_Where<T> extends GraphQuery_Where<_GraphQuery_Base_Has_Space_Where_FN> implements GraphQuery_End<bool> {
  GraphQuery_Base_Has_Space _parent;

  GraphQuery_Base_Has_Space_Where(this._parent, _GraphQuery_Base_Has_Space_Where_FN fn) : super(fn);

  bool get end => _parent._parent._parent._find_allBy<T>(Some(_parent._space)).any((box) => _fn(box.node));
}

class GraphQuery_Base_Has_Space_Where_AllType extends GraphQuery_Where<_GraphQuery_Base_Has_Space_Where_FN> implements GraphQuery_End<bool> {
  GraphQuery_Base_Has_Space_AllType _parent;

  GraphQuery_Base_Has_Space_Where_AllType(this._parent, _GraphQuery_Base_Has_Space_Where_FN fn) : super(fn);

  bool get end => _parent._parent._parent._find_all(Some(_parent._space)).any((box) => _fn(box.node));
}

class GraphQuery_Base_Has_Where<T> extends GraphQuery_Where<_GraphQuery_Base_Has_Space_Where_FN> implements GraphQuery_End<bool> {
  GraphQuery_Base_Has _parent;

  GraphQuery_Base_Has_Where(this._parent, _GraphQuery_Base_Has_Space_Where_FN fn) : super(fn);

  bool get end => _parent._parent._find_allBy<T>(None()).any((box) => _fn(box.node));
}

class GraphQuery_Base_Has_Where_AllType extends GraphQuery_Where<_GraphQuery_Base_Has_Space_Where_FN> implements GraphQuery_End<bool> {
  GraphQuery_Base_Has _parent;

  GraphQuery_Base_Has_Where_AllType(this._parent, _GraphQuery_Base_Has_Space_Where_FN fn) : super(fn);

  bool get end => _parent._parent._find_all(None()).any((box) => _fn(box.node));
}
