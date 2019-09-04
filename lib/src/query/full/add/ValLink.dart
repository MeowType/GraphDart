part of meowtype.graph.query.full.add;

class ValLink<F, V> implements _ILink {
  final Link<F> _parent;
  final V _val;
  ValLink(this._parent, this._val);

  ValLinkNode<F, V, dynamic> node(node, [space = NoneSpace]) => nodeBy(node, space);
  ValLinkNode<F, V, T> nodeBy<T>(T node, [space = NoneSpace]) => ValLinkNode<F, V, T>(this, node, space);
  ValLinkNodeTo<F, V, dynamic> to(node, [space = NoneSpace]) => toBy(node, space);
  ValLinkNodeTo<F, V, T> toBy<T>(T node, [space = NoneSpace]) => ValLinkNodeTo<F, V, T>(this, node, space);
}

class ValLinkNode<F, V, T> implements _INode<T> {
  final ValLink<F, V> _parent;
  final T _node;
  final dynamic _space;
  ValLinkNode(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent._parent._parent._parent
      .set_link_with_val<F, T, V>(_parent._parent._parent._node, _node, _parent._val, spaceA: _parent._parent._parent._space, spaceB: _space, spaceLink: _parent._parent._space);
}

class ValLinkNodeTo<F, V, T> implements _INode<T> {
  final ValLink<F, V> _parent;
  final T _node;
  final dynamic _space;
  ValLinkNodeTo(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent._parent._parent._parent
      .set_linkTo_with_val<F, T, V>(_parent._parent._parent._node, _node, _parent._val, spaceFrom: _parent._parent._parent._space, spaceTo: _space, spaceLink: _parent._parent._space);
}
