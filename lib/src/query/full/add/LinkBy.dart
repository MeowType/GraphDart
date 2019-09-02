part of meowtype.graph.query.full.add;

class LinkBy<T> implements _ILink {
  final Node _parent;
  final dynamic _space;
  LinkBy(this._parent, [this._space = NoneSpace]);

  ValLinkBy val(T val) => ValLinkBy(this, val);

  LinkByNode node(node, [space = NoneSpace]) => nodeBy(node, space);
  LinkByNode<T> nodeBy<T>(T node, [space = NoneSpace]) => LinkByNode<T>(this, node, space);
  LinkByNodeTo to(node, [space = NoneSpace]) => toBy(node, space);
  LinkByNodeTo<T> toBy<T>(T node, [space = NoneSpace]) => LinkByNodeTo<T>(this, node, space);
}

class LinkByNode<T> implements _INode<T> {
  final LinkBy _parent;
  final T _node;
  final dynamic _space;
  LinkByNode(this._parent, this._node, [this._space = NoneSpace]);

  //bool get end => _parent._parent.to_add<T>(_node, _space);
}

class LinkByNodeTo<T> implements _INode<T> {
  final LinkBy _parent;
  final T _node;
  final dynamic _space;
  LinkByNodeTo(this._parent, this._node, [this._space = NoneSpace]);

  //bool get end => _parent._parent.to_add<T>(_node, _space);
}
