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

  Space space([space = NoneSpace]) => Space(this, space);

  Where<T> where<T>(Func1<bool, dynamic> fn, [Func1<bool, dynamic> fnSpace]) => Where<T>(this, fn, fnSpace);
}

class Node<T> {
  final Has _parent;
  final T _node;
  final dynamic _space;
  Node(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent.check_has<T>(_node, _space);
}

class Space {
  final Has _parent;
  final dynamic _space;
  Space(this._parent, [this._space = NoneSpace]);

  SpaceWhere<T> where<T>(Func1<bool, dynamic> fn) => SpaceWhere<T>(this, fn);
}

class SpaceWhere<T> {
  final Space _parent;
  final Func1<bool, dynamic> _fn;
  SpaceWhere(this._parent, this._fn);

  bool get end => _parent._parent._parent.find_all<T>(space: Some(_parent._space), where: _fn).any(any_to_true);
}

class Where<T> {
  final Has _parent;
  final Func1<bool, dynamic> _fn;
  final Func1<bool, dynamic> _fnSpace;
  Where(this._parent, this._fn, [this._fnSpace]);

  bool get end => _parent._parent.find_all<T>(where: _fn, where_space: _fnSpace).any(any_to_true);
}
