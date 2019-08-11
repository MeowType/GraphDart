part of meowtype.graph;

/// Directed graph, but can set the direction of the edge and the value of the edge
abstract class DirectedValueGraph extends DirectedGraph implements GraphGet {
  factory DirectedValueGraph() = FullGraph;
  /// Link a directed link with value, if [from] and [to] don't exist, they will be added
  void setTo(from, to, key, val);
  /// Link a directed link with value but by Generic, if [from] and [to] don't exist, they will be added
  /// 
  /// Equivalent to [setTo]([from], [to], **[T]**, [val])
  void setToBy<T>(from, to, val);
  /// Determine if there is such a valued directed link
  bool hasEdgeTo(from, to, key);
  /// Determine if there is such a valued directed link but by Generic  
  /// 
  /// Equivalent to [hasEdgeTo]([from], [to], **[T]**)
  bool hasEdgeToBy<T>(from, to);
  /// Remove a valued directed link, but will not remove [from] and [to]
  bool unSetTo(from, to, key);
  /// Remove a valued directed link but by Generic, but will not remove [from] and [to]
  /// 
  /// Equivalent to [unSetTo]([from], [to], **[T]**)
  bool unSetToBy<T>(from, to);
  /// Get all values link from [val]
  Iterable valueTos(val, key);
  /// Get all values link to [val]
  Iterable valueFroms(val, key);
  /// Get all values link from [val] but by Generic
  /// 
  /// Equivalent to [valueTos]([val], **[T]**)
  Iterable valueTosBy<T>(val);
  /// Get all values link to [val] but by Generic
  /// 
  /// Equivalent to [valueFroms]([val], **[T]**)
  Iterable valueFromsBy<T>(val);
}

/// Mixing of implementations of [DirectedValueGraph]
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

  Iterable valueTosBy<T>(val) {
    final _v = _map_add_or_get(val, _newNode);

    final v = _v.to.keys
        .map((n) => _v.get(n, T))
        .where((m) => m.has)
        .map((s) => s.val);
    return v;
  }

  Iterable valueFromsBy<T>(val) {
    final _v = _map_add_or_get(val, _newNode);

    final v =
        _v.from.map((n) => n.get(_v, T)).where((m) => m.has).map((s) => s.val);
    return v;
  }
}
