part of meowtype.graph.query.full.find;

class LinkVal<F, V> {
  final Link<F> _parent;
  final Func1<bool, V> _where;

  LinkVal(this._parent, [this._where]);

  LinkValNode<F, T, V> node<T>([Func1<bool, T> where]) => LinkValNode(this, where);
  LinkToValNode<F, T, V> to<T>([Func1<bool, T> where]) => LinkToValNode(this, where);

  Iterable<FindLinkValBox<dynamic, dynamic, V>> get end => _parent._parent._parent._parent.find_all_link_WithVal<F, dynamic, V>(fromWhere: _parent._parent._where, fromSpace: _parent._space, linkSpace: _parent._space, valWhere: _where, direct: LinkDirection.To);
  Iterable<FindLinkValBox<dynamic, dynamic, V>> get mutual => _parent._parent._parent._parent.find_all_link_WithVal<F, dynamic, V>(fromWhere: _parent._parent._where, fromSpace: _parent._space, linkSpace: _parent._space, valWhere: _where, direct: LinkDirection.Mutual);
}

class LinkValNode<F, T, V> {
  final LinkVal<F, V> _parent;
  final Func1<bool, T> _where;
  final Or<dynamic, Func1<bool, dynamic>> _space;

  LinkValNode(this._parent, [this._where, this._space]);
  LinkValNode.Space(LinkVal<F, V> parent, Func1<bool, T> where, [space = NoneSpace]) : this(parent, where, Or.L(space));
  LinkValNode.SpaceWhere(LinkVal<F, V> parent, Func1<bool, T> where, Func1<bool, dynamic> whereSpace) : this(parent, where, Or.R(whereSpace));

  LinkValNode<F, T, V> space([space = NoneSpace]) => LinkValNode.Space(_parent, _where, space);
  LinkValNode<F, T, V> spaceWhere(Func1<bool, dynamic> where) => LinkValNode.SpaceWhere(_parent, _where, where);

  Iterable<FindLinkValBox<dynamic, dynamic, V>> get end => _parent._parent._parent._parent._parent.find_all_link_WithVal<F, T, V>(
      fromWhere: _parent._parent._parent._where,
      fromSpace: _parent._parent._space,
      toWhere: _where,
      toSpace: _space,
      linkSpace: _parent._parent._space,
      valWhere: _parent._where,
      direct: LinkDirection.Mutual);
}

class LinkToValNode<F, T, V> {
  final LinkVal<F, V> _parent;
  final Func1<bool, T> _where;
  final Or<dynamic, Func1<bool, dynamic>> _space;

  LinkToValNode(this._parent, [this._where, this._space]);
  LinkToValNode.Space(LinkVal<F, V> parent, Func1<bool, T> where, [space = NoneSpace]) : this(parent, where, Or.L(space));
  LinkToValNode.SpaceWhere(LinkVal<F, V> parent, Func1<bool, T> where, Func1<bool, dynamic> whereSpace) : this(parent, where, Or.R(whereSpace));

  LinkToValNode<F, T, V> space([space = NoneSpace]) => LinkToValNode.Space(_parent, _where, space);
  LinkToValNode<F, T, V> spaceWhere(Func1<bool, dynamic> where) => LinkToValNode.SpaceWhere(_parent, _where, where);

  Iterable<FindLinkValBox<dynamic, dynamic, V>> get end => _parent._parent._parent._parent._parent.find_all_link_WithVal<F, T, V>(
      fromWhere: _parent._parent._parent._where,
      fromSpace: _parent._parent._space,
      toWhere: _where,
      toSpace: _space,
      linkSpace: _parent._parent._space,
      valWhere: _parent._where,
      direct: LinkDirection.To);
}
