library meowtype.graph.query.base.add;

import '../../graph.dart';
import '../query.dart';

class Add {
  final GraphBase _parent;
  Add(this._parent);

  Node node(node, [space = NoneSpace]) => Node(this, node, space);
  Node<T> nodeBy<T>(T node, [space = NoneSpace]) => Node<T>(this, node, space);
}

class Node<T> {
  final Add _parent;
  final T _node;
  final dynamic _space;
  Node(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent.to_add(_node, _space);
}
