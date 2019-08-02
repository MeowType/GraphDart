part of MeowType.Graph;

abstract class UndirectedValueGraph extends UndirectedGraph {
  factory UndirectedValueGraph() => FullGraph();
  void set(a, b, key, val);
  void setBy<T>(a, b, val);
  bool hasEdge(a, b, key);
  bool hasEdgeBy<T>(a, b);
  bool unSet(a, b, key);
  bool unSetBy<T>(a, b);
  Iterable values(val, key);
}

mixin UndirectedValueGraphMixin on UndirectedGraphMixin
    implements UndirectedValueGraph, GraphGet {
  void set(a, b, key, val) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    _a.setFrom(b);
    _b.setFrom(a);
    _a.setToV(b, key, val);
    _b.setToV(a, key, val);
  }

  void setBy<T>(a, b, val) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    _a.setFrom(b);
    _b.setFrom(a);
    _a.setToT<T>(b, val);
    _b.setToT<T>(a, val);
  }

  bool hasEdge(a, b, key) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    return _a.hasToV(_b, key) && _b.hasToV(_a, key);
  }

  bool hasEdgeBy<T>(a, b) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    return _a.hasToT<T>(_b) && _b.hasToT<T>(_a);
  }

  bool unSet(a, b, key) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);

    final ar = _a.unsetToV(_b, key);
    final br = _b.unsetToV(_a, key);
    return ar || br;
  }

  bool unSetBy<T>(a, b) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);

    final ar = _a.unsetToV(_b, T);
    final br = _b.unsetToV(_a, T);
    return ar || br;
  }

  Iterable values(val, key) {
    final _v = _map_add_or_get(val, _newNode);

    final a = _v.to.keys.map((n) => _v.get(n, key));
    final b = _v.from.map((n) => n.get(_v, key));
    final v = _concat(a, b).where((m) => m.has).map((s) => s.val);
    return v;
  }
}
