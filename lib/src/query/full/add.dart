library meowtype.graph.query.full.add;

import '../../graph.dart';
import '../query.dart';

part './add/Link.dart';
part './add/LinkBy.dart';
part './add/ValLink.dart';
part './add/ValLinkBy.dart';

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

  Link link([space = NoneSpace]) => Link(this, space);
  LinkBy<T> linkBy<T>([space = NoneSpace]) => LinkBy<T>(this, space);

  bool get end => _parent._parent.to_add<T>(_node, _space);
}

abstract class _INode<T> {}

abstract class _ILink {
  _INode node(node, [space = NoneSpace]);
  _INode<T> nodeBy<T>(T node, [space = NoneSpace]);
  _INode to(node, [space = NoneSpace]);
  _INode<T> toBy<T>(T node, [space = NoneSpace]);
}

