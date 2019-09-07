part of meowtype.graph.query.full.has;

class Link<F> implements _ILink {
  final Node<F> _parent;
  final dynamic _space;
  Link(this._parent, [this._space = NoneSpace]);

  Link<F> call([space = NoneSpace]) => Link(_parent, space);

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

  bool get end => null;
}

class LinkNodeTo<F, T> implements _INode<T> {
  final Link<F> _parent;
  final T _node;
  final dynamic _space;
  LinkNodeTo(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => null;
}
