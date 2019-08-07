part of MeowType.Graph;

abstract class UndirectedGraph extends GraphItems {
  factory UndirectedGraph() => FullGraph();
  void link(a, b);
  bool hasLink(a, b);
  bool unLink(a, b);
  Iterable links(val);
}

mixin UndirectedGraphMixin on GraphItemsMixin implements UndirectedGraph {
  void link(a, b) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    _a.setFrom(_b);
    _b.setFrom(_a);
    _a.setTo(_b);
    _b.setTo(_a);
  }

  bool hasLink(a, b) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    return _a.hasTo(_b) && _b.hasTo(_a);
  }

  bool unLink(a, b) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    final x = _a.unsetTo(_b);
    final y = _a.unsetFrom(_b);
    final z = _b.unsetTo(_a);
    final w = _b.unsetFrom(_a);
    return x || y || z || w;
  }

  Iterable links(val) {
    final _v = _map_add_or_get(val, _newNode);
    final from = _v.from.map((n) => _node_to_val[n]);
    final to = _v.to.keys.map((n) => _node_to_val[n]);
    return _concat(from, to).toSet();
  }
}
