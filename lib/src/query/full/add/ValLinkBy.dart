part of meowtype.graph.query.full.add;

class ValLinkBy<T> implements _ILink {
  final LinkBy _parent;
  final T _val;
  ValLinkBy(this._parent, this._val);

  ValLinkByNode node(node, [space = NoneSpace]) => nodeBy(node, space);
  ValLinkByNode<T> nodeBy<T>(T node, [space = NoneSpace]) => ValLinkByNode<T>(this, node, space);
  ValLinkByNodeTo to(node, [space = NoneSpace]) => toBy(node, space);
  ValLinkByNodeTo<T> toBy<T>(T node, [space = NoneSpace]) => ValLinkByNodeTo<T>(this, node, space);
}

class ValLinkByNode<T> implements _INode<T> {
  final ValLinkBy _parent;
  final T _node;
  final dynamic _space;
  ValLinkByNode(this._parent, this._node, [this._space = NoneSpace]);

  //bool get end => _parent._parent.to_add<T>(_node, _space);
}

class ValLinkByNodeTo<T> implements _INode<T> {
  final ValLinkBy _parent;
  final T _node;
  final dynamic _space;
  ValLinkByNodeTo(this._parent, this._node, [this._space = NoneSpace]);

  //bool get end => _parent._parent.to_add<T>(_node, _space);
}
