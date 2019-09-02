part of meowtype.graph.query.full.add;

class ValLink implements _ILink {
  final Link _parent;
  final dynamic _val;
  ValLink(this._parent, this._val);

  ValLinkNode node(node, [space = NoneSpace]) => nodeBy(node, space);
  ValLinkNode<T> nodeBy<T>(T node, [space = NoneSpace]) => ValLinkNode<T>(this, node, space);
  ValLinkNodeTo to(node, [space = NoneSpace]) => toBy(node, space);
  ValLinkNodeTo<T> toBy<T>(T node, [space = NoneSpace]) => ValLinkNodeTo<T>(this, node, space);
}

class ValLinkNode<T> implements _INode<T> {
  final ValLink _parent;
  final T _node;
  final dynamic _space;
  ValLinkNode(this._parent, this._node, [this._space = NoneSpace]);

  //bool get end => _parent._parent.to_add<T>(_node, _space);
}

class ValLinkNodeTo<T> implements _INode<T> {
  final ValLink _parent;
  final T _node;
  final dynamic _space;
  ValLinkNodeTo(this._parent, this._node, [this._space = NoneSpace]);

  //bool get end => _parent._parent.to_add<T>(_node, _space);
}
