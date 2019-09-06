part of meowtype.graph.query.full.has;

class Link<F> {
  final Node<F> _parent;
  final dynamic _space;
  Link(this._parent, [this._space = NoneSpace]);

  Link<F> call([space = NoneSpace]) => Link(_parent, space);
}
