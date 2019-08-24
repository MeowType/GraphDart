part of meowtype.graph;

class GraphQuery_Base_Add {
  final GraphBase _parent;
  GraphQuery_Base_Add(this._parent);

  GraphQuery_Base_Add_Node<T> nodeBy<T>(T node, [space = NoneSpace]) => GraphQuery_Base_Add_Node<T>(this, node, space);
}

class GraphQuery_Base_Add_Node<T> extends GraphQuery_Node<T> {
  final GraphQuery_Base_Add _parent;
  GraphQuery_Base_Add_Node(this._parent, T node, [space = NoneSpace]) : super(node, space);

  bool get end => _parent._parent._to_add(_node, _space);
}
