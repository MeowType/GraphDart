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
}

class Node<T> {
  final Remove _parent;
  final T _node;
  final dynamic _space;
  Node(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent.try_remove<T>(_node, _space);
}
