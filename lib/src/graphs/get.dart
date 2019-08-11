part of meowtype.graph;

/// The part used to get the value of the edge in the graph
abstract class GraphGet implements GraphItems {
  /// Get the value on the specified edge
  Maybe get(from, to, key);
  /// Get the value on the specified edge but by Generic
  /// 
  /// Equivalent to [get]([from], [to], **[T]**)
  Maybe getBy<T>(from, to);
}

/// Mixing of implementations of [GraphGet]
mixin GraphGetMixin on GraphItemsMixin {
  Maybe get(from, to, key) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    return _f.get(_t, key);
  }

  Maybe getBy<T>(from, to) {
    final _f = _map_add_or_get(from, _newNode);
    final _t = _map_add_or_get(to, _newNode);
    return _f.getT<T>(_t);
  }
}
