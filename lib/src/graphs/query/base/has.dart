part of meowtype.graph;

class GraphQuery_Base_Has extends GraphQuery
    with GraphQueryGETNodeMixin<GraphQuery_Base_Has_Node>
    implements
        IGraphQueryGETNode,
        IGraphQueryGETSpace,
        IGraphQueryGETSpaceAllType,
        IGraphQueryGETWhereT<Func2<bool, dynamic, dynamic>>,
        IGraphQueryGETWhereAllType<Func3<bool, dynamic, dynamic, Type>> {
  GraphBase _parent;

  GraphQuery_Base_Has(this._parent) : super();

  GraphQuery_Base_Has_Node<T> nodeBy<T>(T node, [space = NoneSpace]) => GraphQuery_Base_Has_Node<T>(this, node, space);
  GraphQuery_Base_Has_Space<T> space<T>([space = NoneSpace]) => GraphQuery_Base_Has_Space<T>(this, space);
  GraphQuery_Base_Has_Space_AllType spaceAllType([space = NoneSpace]) => GraphQuery_Base_Has_Space_AllType(this, space);
  GraphQuery_Base_Has_Where<T> where<T>(Func2<bool, dynamic, dynamic> fn) => GraphQuery_Base_Has_Where<T>(this, fn);
  GraphQuery_Base_Has_Where_AllType whereAllType(Func3<bool, dynamic, dynamic, Type> fn) => GraphQuery_Base_Has_Where_AllType(this, fn);
}

class GraphQuery_Base_Has_Node<T> extends GraphQuery_Node<T> implements GraphQuery_End<bool> {
  final GraphQuery_Base_Has _parent;

  GraphQuery_Base_Has_Node(this._parent, T node, [space = NoneSpace]) : super(node, space);

  bool get end => _parent._parent._has(_node, _space);
}

class GraphQuery_Base_Has_Space<T> extends GraphQuery_Space<T> implements IGraphQueryGETWhere<Func1<bool, dynamic>> {
  final GraphQuery_Base_Has _parent;

  GraphQuery_Base_Has_Space(this._parent, [space = NoneSpace]) : super(space);

  GraphQuery_Base_Has_Space_Where<T> where(Func1<bool, dynamic> fn) => GraphQuery_Base_Has_Space_Where(this, fn);
}

class GraphQuery_Base_Has_Space_AllType extends GraphQuery_Space_AllType implements IGraphQueryGETWhere<Func2<bool, dynamic, Type>> {
  final GraphQuery_Base_Has _parent;

  GraphQuery_Base_Has_Space_AllType(this._parent, [space = NoneSpace]) : super(space);

  GraphQuery_Base_Has_Space_Where_AllType where(Func2<bool, dynamic, Type> fn) => GraphQuery_Base_Has_Space_Where_AllType(this, fn);
}

class GraphQuery_Base_Has_Space_Where<T> extends GraphQuery_Where<Func1<bool, dynamic>> implements GraphQuery_End<bool> {
  final GraphQuery_Base_Has_Space _parent;

  GraphQuery_Base_Has_Space_Where(this._parent, Func1<bool, dynamic> fn) : super(fn);

  bool get end => _parent._parent._parent._find_allBy<T>(Some(_parent._space), (n, s) => _fn(n)).any(_any_to_true);
}

class GraphQuery_Base_Has_Space_Where_AllType extends GraphQuery_Where<Func2<bool, dynamic, Type>> implements GraphQuery_End<bool> {
  final GraphQuery_Base_Has_Space_AllType _parent;

  GraphQuery_Base_Has_Space_Where_AllType(this._parent, Func2<bool, dynamic, Type> fn) : super(fn);

  bool get end => _parent._parent._parent._find_all(Some(_parent._space), (n, s, t) => _fn(n, t)).any(_any_to_true);
}

class GraphQuery_Base_Has_Where<T> extends GraphQuery_Where<Func2<bool, dynamic, dynamic>> implements GraphQuery_End<bool> {
  final GraphQuery_Base_Has _parent;

  GraphQuery_Base_Has_Where(this._parent, Func2<bool, dynamic, dynamic> fn) : super(fn);

  bool get end => _parent._parent._find_allBy<T>(null, _fn).any(_any_to_true);
}

class GraphQuery_Base_Has_Where_AllType extends GraphQuery_Where<Func3<bool, dynamic, dynamic, Type>> implements GraphQuery_End<bool> {
  final GraphQuery_Base_Has _parent;

  GraphQuery_Base_Has_Where_AllType(this._parent, Func3<bool, dynamic, dynamic, Type> fn) : super(fn);

  bool get end => _parent._parent._find_all(null, _fn).any(_any_to_true);
}
