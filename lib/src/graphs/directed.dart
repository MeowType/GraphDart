part of MeowType.Graph;

abstract class DirectedGraph extends GraphItems {
  factory DirectedGraph() => FullGraph();
  void linkTo(from, to);
  bool hasLinkTo(from, to);
  bool unLinkTo(from, to);
}

mixin DirectedGraphMixin on GraphItemsMixin implements DirectedGraph {
  void linkTo(from, to) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    _t.setFrom(_f);
    _f.setTo(_t);
  }

  bool hasLinkTo(from, to) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    return _f.hasTo(_t);
  }

  bool unLinkTo(from, to) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    final a = _f.unsetTo(_t);
    final b = _t.unsetFrom(_f);
    return a || b;
  }

  Iterable linkTos(val) {
    final _v = _map_add_or_get(val, _newNode);
    final to = _v.to.keys.map((n) => _node_to_val[n]);
    return to;
  }
}
