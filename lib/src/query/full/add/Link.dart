part of meowtype.graph.query.full.add;

class Link<F> implements _ILink {
  final Node<F> _parent;
  final dynamic _space;
  Link(this._parent, [this._space = NoneSpace]);

  ValLink<F, V> val<V>(val) => ValLink<F, V>(this, val);

  LinkNode<F, dynamic> node(node, [space = NoneSpace]) => nodeBy(node, space);
  LinkNode<F, T> nodeBy<T>(T node, [space = NoneSpace]) => LinkNode<F, T>(this, node, space);
  LinkNodeTo<F, dynamic> to(node, [space = NoneSpace]) => toBy(node, space);
  LinkNodeTo<F, T> toBy<T>(T node, [space = NoneSpace]) => LinkNodeTo<F, T>(this, node, space);
}

class LinkNode<F, T> implements _INode<T> {
  final Link<F> _parent;
  final T _node;
  final dynamic _space;
  LinkNode(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent._parent._parent.set_link<F, T>(_parent._parent._node, _node, spaceA: _parent._parent._space, spaceB: _space, spaceLink: _parent._space);
}

class LinkNodeTo<F, T> implements _INode<T> {
  final Link<F> _parent;
  final T _node;
  final dynamic _space;
  LinkNodeTo(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent._parent._parent.set_linkTo<F, T>(_parent._parent._node, _node, spaceFrom: _parent._parent._space, spaceTo: _space, spaceLink: _parent._space);
}
