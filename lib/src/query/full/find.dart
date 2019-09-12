library meowtype.graph.query.full.find;

import 'package:graph_collection/src/other/Or.dart';
import 'package:graph_collection/src/other/utils.dart';

import '../../graph.dart';
import '../query.dart';

part './find/Link.dart';

class Find {
  final FullGraph _parent;
  Find(this._parent);

  FindFrom<F> node<F>([Func1<bool, F> where]) => FindFrom<F>(this, where, null);
}

class FindFrom<F> {
  final Find _parent;
  final Func1<bool, F> _where;
  final Or<dynamic, Func1<bool, dynamic>> _space;

  FindFrom(this._parent, this._where, this._space);
  FindFrom.Space(Find parent, Func1<bool, F> where, [space = NoneSpace]) : this(parent, where, Or.L(space));
  FindFrom.SpaceWhere(Find parent, Func1<bool, F> where, Func1<bool, dynamic> whereSpace) : this(parent, where, Or.R(whereSpace));

  FindFrom<F> space([space = NoneSpace]) => FindFrom.Space(_parent, _where, space);
  FindFrom<F> spaceWhere(Func1<bool, dynamic> where) => FindFrom.SpaceWhere(_parent, _where, where);

  Link<F> get link => Link<F>(this, null);

  Iterable<FindBox<F>> get end => _parent._parent.find_all(where: _where, space: _space);
  Iterable<FindLinkBox<F, dynamic>> get mutual => _parent._parent.find_all_link(fromWhere: _where, fromSpace: _space, direct: LinkDirection.Mutual);
  Iterable<FindLinkBox<F, dynamic>> get to => _parent._parent.find_all_link(fromWhere: _where, fromSpace: _space, direct: LinkDirection.To);
  Iterable<FindLinkBox<F, dynamic>> get from => _parent._parent.find_all_link(fromWhere: _where, fromSpace: _space, direct: LinkDirection.From);
}
