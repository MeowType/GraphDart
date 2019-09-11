library meowtype.graph.query.full.has;

import 'package:some/index.dart';

import '../../graph.dart';
import '../../other/utils.dart';
import '../query.dart';

part './has/Link.dart';

class Has {
  final FullGraph _parent;
  Has(this._parent);

  Node node(node, [space = NoneSpace]) => Node(this, node, space);
  Node<T> nodeBy<T>(T node, [space = NoneSpace]) => Node<T>(this, node, space);
}

class Node<T> implements _INode<T> {
  final Has _parent;
  final T _node;
  final dynamic _space;
  Node(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent.check_has<T>(_node, _space);

  Link<T> get link => Link<T>(this);
}

abstract class _INode<T> {}

abstract class _ILink {
  _INode node(node, [space = NoneSpace]);
  _INode<T> nodeBy<T>(T node, [space = NoneSpace]);
  _INode to(node, [space = NoneSpace]);
  _INode<T> toBy<T>(T node, [space = NoneSpace]);
}
