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
  Node<F> nodeBy<F>(F node, [space = NoneSpace]) => Node<F>(this, node, space);

  LinkFrom get link => LinkFrom(this);
}

class Node<F> {
  final Has _parent;
  final F _node;
  final dynamic _space;
  Node(this._parent, this._node, [this._space = NoneSpace]);

  bool get end => _parent._parent.check_has<F>(_node, _space);

  Link<F> get link => Link<F>(this);
}

class LinkFrom {
  final Has _parent;
  final dynamic _space;
  LinkFrom(this._parent, [this._space = NoneSpace]);

  LinkFrom call([space = NoneSpace]) => LinkFrom(_parent, space);

  LinkFromNode from(node, [space = NoneSpace]) => fromBy<dynamic>(node, space);
  LinkFromNode<T> fromBy<T>(T node, [space = NoneSpace]) => LinkFromNode<T>(this, node, space);
}

class LinkFromNode<T> {
  final LinkFrom _parent;
  final T _node;
  final dynamic _space;

  LinkFromNode(this._parent, this._node, this._space);

  bool get end => _parent._parent._parent.check_has_link(_node, None(), spaceFrom: _space, spaceLink: _parent._space, direct: LinkDirection.From);
}
