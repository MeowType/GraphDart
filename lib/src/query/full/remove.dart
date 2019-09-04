library meowtype.graph.query.full.remove;

import 'package:some/index.dart';

import '../../graph.dart';
import '../../other/utils.dart';
import '../query.dart';

class Remove {
  final FullGraph _parent;
  Remove(this._parent);

  Node node(node, [space = NoneSpace]) => Node(this, node, space);
  Node<T> nodeBy<T>(T node, [space = NoneSpace]) => Node<T>(this, node, space);

  Space<T> space<T>([space = NoneSpace]) => Space<T>(this, space);

  Where<T> where<T>(Func1<bool, dynamic> fn, [Func1<bool, dynamic> fnSpace]) => Where<T>(this, fn, fnSpace);
}

class Node<T> {
  final Remove _parent;
  final T _node;
  final dynamic _space;
  Node(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent.try_remove<T>(_node, _space);
}

class Space<T> {
  final Remove _parent;
  final dynamic _space;
  Space(this._parent, [this._space = NoneSpace]);

  SpaceWhere<T> where(Func1<bool, dynamic> fn) => SpaceWhere(this, fn);
}

class SpaceWhere<T> {
  final Space _parent;
  final Func1<bool, dynamic> _fn;
  SpaceWhere(this._parent, this._fn);

  bool get end => _parent._parent._parent.try_remove_where<T>(space: Some(_parent._space), where: _fn);
}

class Where<T> {
  final Remove _parent;
  final Func1<bool, dynamic> _fn;
  final Func1<bool, dynamic> _fnSpace;
  Where(this._parent, this._fn, [this._fnSpace]);

  bool get end => _parent._parent.try_remove_where<T>(where: _fn, where_space: _fnSpace);
}
