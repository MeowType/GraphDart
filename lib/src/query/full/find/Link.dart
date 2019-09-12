part of meowtype.graph.query.full.find;

class Link<F> {
  final FindFrom<F> _parent;
  final Or<dynamic, Func1<bool, dynamic>> _space;

  Link(this._parent, [this._space]);
  Link.Space(FindFrom<F> parent, [space = NoneSpace]) : this(parent, Or.L(space));
  Link.SpaceWhere(FindFrom<F> parent, Func1<bool, dynamic> where) : this(parent, Or.R(where));

  LinkVal<F, V> val<V>([Func1<bool, V> where]) => LinkVal(this, where);

  Link<F> call([space = NoneSpace]) => Link.Space(_parent, space);
  Link<F> space(Func1<bool, dynamic> where) => Link.SpaceWhere(_parent, where);

  LinkNode<F, T> node<T>([Func1<bool, T> where]) => LinkNode(this, where);
  LinkToNode<F, T> to<T>([Func1<bool, T> where]) => LinkToNode(this, where);

  Iterable<FindLinkBox> get end => _parent._parent._parent.find_all_link<F, dynamic>(fromWhere: _parent._where, fromSpace: _parent._space, linkSpace: _space, direct: LinkDirection.To);
  Iterable<FindLinkBox> get mutual => _parent._parent._parent.find_all_link<F, dynamic>(fromWhere: _parent._where, fromSpace: _parent._space, linkSpace: _space, direct: LinkDirection.Mutual);
}

class LinkNode<F, T> {
  final Link<F> _parent;
  final Func1<bool, T> _where;
  final Or<dynamic, Func1<bool, dynamic>> _space;

  LinkNode(this._parent, [this._where, this._space]);
  LinkNode.Space(Link<F> parent, Func1<bool, T> where, [space = NoneSpace]) : this(parent, where, Or.L(space));
  LinkNode.SpaceWhere(Link<F> parent, Func1<bool, T> where, Func1<bool, dynamic> whereSpace) : this(parent, where, Or.R(whereSpace));

  LinkNode<F, T> space([space = NoneSpace]) => LinkNode.Space(_parent, _where, space);
  LinkNode<F, T> spaceWhere(Func1<bool, dynamic> where) => LinkNode.SpaceWhere(_parent, _where, where);

  Iterable<FindLinkBox> get end => _parent._parent._parent._parent
      .find_all_link<F, T>(fromWhere: _parent._parent._where, fromSpace: _parent._parent._space, toWhere: _where, toSpace: _space, linkSpace: _parent._space, direct: LinkDirection.Mutual);
}

class LinkToNode<F, T> {
  final Link<F> _parent;
  final Func1<bool, T> _where;
  final Or<dynamic, Func1<bool, dynamic>> _space;

  LinkToNode(this._parent, [this._where, this._space]);
  LinkToNode.Space(Link<F> parent, Func1<bool, T> where, [space = NoneSpace]) : this(parent, where, Or.L(space));
  LinkToNode.SpaceWhere(Link<F> parent, Func1<bool, T> where, Func1<bool, dynamic> whereSpace) : this(parent, where, Or.R(whereSpace));

  LinkToNode<F, T> space([space = NoneSpace]) => LinkToNode.Space(_parent, _where, space);
  LinkToNode<F, T> spaceWhere(Func1<bool, dynamic> where) => LinkToNode.SpaceWhere(_parent, _where, where);

  Iterable<FindLinkBox> get end => _parent._parent._parent._parent
      .find_all_link<F, T>(fromWhere: _parent._parent._where, fromSpace: _parent._parent._space, toWhere: _where, toSpace: _space, linkSpace: _parent._space, direct: LinkDirection.To);
}
