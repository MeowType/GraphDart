part of MeowType.Graph;

abstract class DirectedValueGraph extends DirectedGraph {
  factory DirectedValueGraph() => FullGraph();
  void setTo(from, to, key, val);
  void setToBy<T>(from, to, val);
  bool hasEdgeTo(from, to, key);
  bool hasEdgeToBy<T>(from, to);
  bool unSetTo(from, to, key);
  Iterable valueTos(val, key);
  Iterable valueFroms(val, key);
}

mixin DirectedValueGraphMixin on DirectedGraphMixin
    implements DirectedValueGraph, GraphGet {
  void setTo(from, to, key, val) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    _t.setFrom(_f);
    _f.setToV(_t, key, val);
  }

  void setToBy<T>(from, to, val) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    _t.setFrom(_f);
    _f.setToT<T>(_t, val);
  }

  bool hasEdgeTo(from, to, key) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    return _f.hasToV(_t, key);
  }

  bool hasEdgeToBy<T>(from, to) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    return _f.hasToT<T>(_t);
  }

  bool unSetTo(from, to, key) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    return _f.unsetToV(_t, key);
  }

  bool unSetToBy<T>(from, to) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    return _f.unsetToV(_t, T);
  }

  Iterable valueTos(val, key) {
    final _v = _map_add_or_get(val, _newNode);

    final v = _v.to.keys
        .map((n) => _v.get(n, key))
        .where((m) => m.has)
        .map((s) => s.val);
    return v;
  }

  Iterable valueFroms(val, key) {
    final _v = _map_add_or_get(val, _newNode);

    final v = _v.from
        .map((n) => n.get(_v, key))
        .where((m) => m.has)
        .map((s) => s.val);
    return v;
  }
}
