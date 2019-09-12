part of meowtype.graph.query.full.has;

class Link<F> {
  final Node<F> _parent;
  final dynamic _space;
  Link(this._parent, [this._space = NoneSpace]);

  Link<F> call([space = NoneSpace]) => Link(_parent, space);

  LinkNode<F, dynamic> node(node, [space = NoneSpace]) => nodeBy(node, space);
  LinkNode<F, T> nodeBy<T>(T node, [space = NoneSpace]) => LinkNode<F, T>(this, node, space);
  LinkNodeTo<F, dynamic> to(node, [space = NoneSpace]) => toBy(node, space);
  LinkNodeTo<F, T> toBy<T>(T node, [space = NoneSpace]) => LinkNodeTo<F, T>(this, node, space);

  bool get end => _parent._parent._parent.check_has_link(_parent._node, None(), spaceFrom: _parent._space, spaceLink: _space, direct: LinkDirection.To);
  bool get mutual => _parent._parent._parent.check_has_link(_parent._node, None(), spaceFrom: _parent._space, spaceLink: _space, direct: LinkDirection.Mutual);
}

class LinkNode<F, T> {
  final Link<F> _parent;
  final T _node;
  final dynamic _space;
  LinkNode(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent._parent._parent
      .check_has_link<F, T>(_parent._parent._node, Some(_node), spaceFrom: _parent._parent._space, spaceTo: _space, spaceLink: _parent._space, direct: LinkDirection.Mutual);
}

class LinkNodeTo<F, T> {
  final Link<F> _parent;
  final T _node;
  final dynamic _space;
  LinkNodeTo(this._parent, this._node, [this._space = NoneSpace]);

  bool get end =>
      _parent._parent._parent._parent.check_has_link<F, T>(_parent._parent._node, Some(_node), spaceFrom: _parent._parent._space, spaceTo: _space, spaceLink: _parent._space, direct: LinkDirection.To);
}
