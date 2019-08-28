library meowtype.graph.query.full.has;

import 'package:some/index.dart';

import '../../graph.dart';
import '../../other/utils.dart';
import '../query.dart';

class Has {
  final GraphBase _parent;
  Has(this._parent);

  Node node(node, [space = NoneSpace]) => Node(this, node, space);
  Node<T> nodeBy<T>(T node, [space = NoneSpace]) => Node<T>(this, node, space);

  Space<T> space<T>([space = NoneSpace]) => Space<T>(this, space);
  SpaceAllType spaceAllType([space = NoneSpace]) => SpaceAllType(this, space);

  Where<T> where<T>(Func2<bool, dynamic, dynamic> fn) => Where<T>(this, fn);
  WhereAllType whereAllType(Func3<bool, dynamic, dynamic, Type> fn) => WhereAllType(this, fn);
}

class Node<T> {
  final Has _parent;
  final T _node;
  final dynamic _space;
  Node(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent.check_has<T>(_node, _space);
}

class Space<T> {
  final Has _parent;
  final dynamic _space;
  Space(this._parent, [this._space = NoneSpace]);

  SpaceWhere<T> where(Func1<bool, dynamic> fn) => SpaceWhere(this, fn);
}

class SpaceAllType {
  final Has _parent;
  final dynamic _space;
  SpaceAllType(this._parent, [this._space = NoneSpace]);

  SpaceWhereAllType where(Func2<bool, dynamic, Type> fn) => SpaceWhereAllType(this, fn);
}

class SpaceWhere<T> {
  final Space _parent;
  final Func1<bool, dynamic> _fn;
  SpaceWhere(this._parent, this._fn);

  bool get end => _parent._parent._parent.find_allBy<T>(Some(_parent._space), (n, s) => _fn(n)).any(any_to_true);
}

class SpaceWhereAllType {
  final SpaceAllType _parent;
  final Func2<bool, dynamic, Type> _fn;
  SpaceWhereAllType(this._parent, this._fn);

  bool get end => _parent._parent._parent.find_all(Some(_parent._space), (n, s, t) => _fn(n, t)).any(any_to_true);
}

class Where<T> {
  final Has _parent;
  final Func2<bool, dynamic, dynamic> _fn;
  Where(this._parent, this._fn);

  bool get end => _parent._parent.find_allBy<T>(null, _fn).any(any_to_true);
}

class WhereAllType {
  final Has _parent;
  final Func3<bool, dynamic, dynamic, Type> _fn;
  WhereAllType(this._parent, this._fn);

  bool get end => _parent._parent.find_all(null, _fn).any(any_to_true);
}
