part of meowtype.graph;

/// Undirected graph, Can create an edge and value between 2 nodes
abstract class UndirectedValueGraph extends UndirectedGraph implements GraphGet {
  factory UndirectedValueGraph() = FullGraph;
  /// create an link between 2 nodes with value
  void set(a, b, key, val);
  /// create an link between 2 nodes with value but by Generic
  /// 
  /// Equivalent to [set]([a], [b], **[T]**, [val])
  void setBy<T>(a, b, val);
  /// Determine if there is a value link between 2 nodes
  bool hasEdge(a, b, key);
  /// Determine if there is a value link between 2 nodes but by Generic
  /// 
  /// Equivalent to [hasEdge]([a], [b], **[T]**)
  bool hasEdgeBy<T>(a, b);
  /// Remove the valued link between 2 nodes, but will not remove [a] and [b] and the link between them
  bool unSet(a, b, key);
  /// Remove the valued link between 2 nodes but by Generic, but will not remove [a] and [b] and the link between them
  /// 
  /// Equivalent to [unSet]([a], [b], **[T]**)
  bool unSetBy<T>(a, b);
  /// Get all the values on all links of this node
  Iterable values(val, key);
  /// Get all the values on all links of this node but by Generic
  /// 
  /// Equivalent to [values]([val], **[T]**)
  Iterable valuesBy<T>(val);
}

/// Mixing of implementations of [UndirectedValueGraph]
mixin UndirectedValueGraphMixin on UndirectedGraphMixin
    implements UndirectedValueGraph, GraphGet {
  void set(a, b, key, val) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    _a.setFrom(_b);
    _b.setFrom(_a);
    _a.setToV(_b, key, val);
    _b.setToV(_a, key, val);
  }

  void setBy<T>(a, b, val) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    _a.setFrom(_b);
    _b.setFrom(_a);
    _a.setToT<T>(_b, val);
    _b.setToT<T>(_a, val);
  }

  bool hasEdge(a, b, key) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    return _a.hasToV(_b, key) || _b.hasToV(_a, key);
  }

  bool hasEdgeBy<T>(a, b) {
    final _a = _map_add_or_get(a, _newNode);
    final _b = _map_add_or_get(b, _newNode);
    return _a.hasToT<T>(_b) || _b.hasToT<T>(_a);
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
    return v.toSet();
  }

  Iterable valuesBy<T>(val) {
    final _v = _map_add_or_get(val, _newNode);

    final a = _v.to.keys.map((n) => _v.get(n, T));
    final b = _v.from.map((n) => n.get(_v, T));
    final v = _concat(a, b).where((m) => m.has).map((s) => s.val);
    return v.toSet();
  }
}
