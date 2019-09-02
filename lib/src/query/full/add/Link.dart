part of meowtype.graph.query.full.add;

class Link implements _ILink {
  final Node _parent;
  final dynamic _space;
  Link(this._parent, [this._space = NoneSpace]);

  ValLink val(val) => ValLink(this, val);

  LinkNode node(node, [space = NoneSpace]) => nodeBy(node, space);
  LinkNode<T> nodeBy<T>(T node, [space = NoneSpace]) => LinkNode<T>(this, node, space);
  LinkNodeTo to(node, [space = NoneSpace]) => toBy(node, space);
  LinkNodeTo<T> toBy<T>(T node, [space = NoneSpace]) => LinkNodeTo<T>(this, node, space);
}

class LinkNode<T> implements _INode<T> {
  final Link _parent;
  final T _node;
  final dynamic _space;
  LinkNode(this._parent, this._node, [this._space = NoneSpace]);

  //bool get end => _parent._parent.to_add<T>(_node, _space);
}

class LinkNodeTo<T> implements _INode<T> {
  final Link _parent;
  final T _node;
  final dynamic _space;
  LinkNodeTo(this._parent, this._node, [this._space = NoneSpace]);

  //bool get end => _parent._parent.to_add<T>(_node, _space);
}
